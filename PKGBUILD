# Maintainer: anon at sansorgan.es

pkgname=taoup
pkgdesc='TAO (The Art) of Unix Programming (and related systemic epiphanies)'
pkgver=1.8.r20.g6b2726e
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/globalcitizen/taoup"
license=(GPL3)
depends=('ruby-ansi')
optdepends=('cowsay: fortune compatability mode')
source=("git+https://github.com/globalcitizen/taoup")
sha256sums=('SKIP')

pkgver(){
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir"/"$pkgname"
	install -Dm0755 "taoup" "$pkgdir/usr/bin/taoup"
	install -Dm0755 "taoup-fortune" "$pkgdir/usr/bin/taoup-fortune"
}

