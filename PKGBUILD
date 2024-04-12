# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
pkgname=gtksourceview3-fish-git
pkgver=5.12.0.r7.g3b7476d
pkgrel=1
pkgdesc='GtkSourceView3 syntax highlighting for fish shell scripts.'
arch=('any')
url='https://gitlab.gnome.org/GNOME/gtksourceview/-/merge_requests/20'
license=('LGPL-2.1-or-later')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/GNOME/gtksourceview.git')
md5sums=('SKIP')

pkgver() {
  git -C 'gtksourceview/' describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  depends=('gtksourceview3')
  install -Dm644 gtksourceview/data/language-specs/fish.lang "$pkgdir"/usr/share/gtksourceview-3.0/language-specs/fish.lang
}
