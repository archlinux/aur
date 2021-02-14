# Maintainer: anon at sansorgan.es
_pkgname=taoup
pkgname=taoup-git
pkgdesc='TAO (The Art) of Unix Programming (and related systemic epiphanies)'
pkgver=1.1.11.r0.gdb220bc
pkgrel=1
arch=('any')
url="https://github.com/globalcitizen/taoup"
license=(GPL3)
depends=('ruby-ansi')
optdepends=('cowsay: fortune compatability mode')
provides=('taoup')
source=("git+https://github.com/globalcitizen/taoup")
sha256sums=('SKIP')

pkgver(){
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir"/"$_pkgname"
	install -Dm0755 "taoup" "$pkgdir/usr/bin/taoup"
	install -Dm0755 "taoup-fortune" "$pkgdir/usr/bin/taoup-fortune"
}

