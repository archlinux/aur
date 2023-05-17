# Maintainer: n00bady <kaz00@vivaldi.net>

pkgname=ttvchecker
pkgver=0.1.2
pkgrel=1
pkgdesc="A cli tool to check if your favorite twitch streamers are online written in GO."
arch=('x86_64')
url="https://gitlab.com/n00bady/ttvchecker"
license=('GPL3')
provides=("$pkgname")
conflicts=("$pkgname")
makedepends=('go')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('2d213d2fd9287bd274758dfcd82d91d950d54c5a6d8e7770b363b7a616c742013f56515f7625746d30607850368ea541e1cb779f4d8ad4012a888d4716570b87')

build() {
  cd ${pkgname}-${pkgver}
  go build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
}

