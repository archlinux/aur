# Maintainer: Evan McCarthy <evan@mccarthy.mn>

pkgname=catgirl
pkgver=1.2
pkgrel=1
pkgdesc='catgirl is a TLS-only terminal IRC client.'
arch=('x86_64')
url="https://git.causal.agency/${pkgname}/"
license=('GPL3')
depends=('libretls' 'ncurses')
source=("https://git.causal.agency/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
b2sums=('dd9f99db1b6e2114157395ce77cff30492fa1409133d21f190b279f7fad0ecfeb399c115fc83a175a86f41d07406acc063807ef3b47253c1ec2f9f4bc4104362')

build() {
      cd "${pkgname}-${pkgver}"
      ./configure --prefix=/usr
      make all
}

package() {
      cd "${pkgname}-${pkgver}"
          make DESTDIR="$pkgdir/" install
}
