# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
pkgname=gtksourceview3-fish-git
pkgver=r1.86b94ce
pkgrel=1
pkgdesc='GtkSourceView3 syntax highlighting for fish shell scripts.'
arch=('any')
url='https://github.com/fish-shell/fish-shell/issues/1812'
license=('GPL')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('fish-syntax::git+https://gist.github.com/1f811a567b180e9eeacd.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/fish-syntax"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/fish-syntax"
  install -Dm644 fish.lang "$pkgdir"/usr/share/gtksourceview-3.0/language-specs/fish.lang
}
