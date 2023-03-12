# Maintainer: n00bady <kaz00@vivaldi.net>

pkgname=ttvchecker
pkgver=0.1.1
pkgrel=1
pkgdesc="A cli tool to check if your favorite twitch streamers are online written in GO."
arch=('x86_64')
url="https://gitlab.com/n00bady/ttvchecker"
license=('GPL3')
provides=("$pkgname")
conflicts=("$pkgname")
makedepends=('go')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('f8321ccd252fd1ac824ea90336df879ccc8e346d34f134d358f8f07a08804f20369817e358f7a1382e8b06ebe7dd6646dc4a03a64835dbdd7d95ff544c27d75e')

build() {
  cd ${pkgname}-${pkgver}
  go build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
}

