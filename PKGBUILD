# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=xfer9860
pkgver=0.2.2
pkgrel=2
pkgdesc=" A linux app for sending and recieving data from a casio calculator"
arch=('x86_64')
url="https://github.com/sanjay900/xfer9860"
license=('GPL2')
depends=('libusb')
makedepends=('scons')
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2"
        "$pkgname-$pkgver.patch::https://github.com/sanjay900/xfer9860/commit/10cc090e363644be3aa070e6e795e1972bf28427.patch")
sha256sums=('bc245995a6987fe4706144b4e95af6391d94d82e226ca2bf3d799b9ec733d7ac'
            '1283b75134ad42e9b67d5ba6ef8f0ecef5dcdc1de0be7a329b1bd8a3ddfbeee9')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
  cd "$pkgname-$pkgver"
  scons
}

package() {
  cd "$pkgname-$pkgver"
  install -D "src/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
