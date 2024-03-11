# Maintainer: n00bady <kaz00@vivaldi.net>

pkgname=ttvchecker
pkgver=0.2.2
pkgrel=1
pkgdesc="A cli tool to check if your favorite twitch streamers are online written in GO."
arch=('x86_64')
url="https://gitlab.com/n00bady/ttvchecker"
license=('GPL3')
provides=("$pkgname")
conflicts=("$pkgname")
makedepends=('go')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('2bb725a853604013267fd38326c8c31def99cc04e317a01326bff46e9da2ca4690c1008c5b9b5a69aad6e4d67c1b692253ec22c5d2cb8c2b88cc3b3097dd589d')

build() {
  cd ${pkgname}-${pkgver}
  go build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
}

