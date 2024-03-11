# Maintainer: n00bady <kaz00@vivaldi.net>

pkgname=ttvchecker
pkgver=0.2.2
pkgrel=2
pkgdesc="A cli tool to check if your favorite twitch streamers are online written in GO."
arch=('x86_64')
url="https://gitlab.com/n00bady/ttvchecker"
license=('GPL3')
provides=("$pkgname")
conflicts=("$pkgname")
makedepends=('go')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('f45aaf1f8a618c859b651619346a713d442eb3ad972777d56c74decb424e9da721e2ffc7a0790c7f0f76e4da0576bd3521cd0cb25a9a3883579826bb96f2c3d8')

build() {
  cd ${pkgname}-${pkgver}
  go build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
}

