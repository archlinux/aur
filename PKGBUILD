# Maintainer: erk <valdemarerk@gmail.com>
pkgname=gravity-lang-git
pkgdesc="Gravity Programming Language."
pkgver=0.2.5
pkgrel=2
arch=('any')
url="https://marcobambini.github.io/gravity/"
license=('MIT')
makedepends=('git')
conflicts=(gravity-lang)
provides=(gravity)
source=("git://github.com/marcobambini/gravity.git")
md5sums=(SKIP)

_repo_name=gravity

build() {
  cd "$srcdir/$_repo_name"
  make gravity
}

package() {
  install -D -m 755 "$srcdir/$_repo_name/gravity" "$pkgdir/usr/bin/gravity"
}
