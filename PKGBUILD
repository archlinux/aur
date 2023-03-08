# Maintainer: n00bady <kaz00@vivaldi.net>

pkgname=ttvchecker
pkgver=0.1.0
pkgrel=1
pkgdesc="A cli tool to check if your favorite twitch streamers are online written in GO."
arch=('x86_64')
url="https://gitlab.com/n00bady/ttvchecker"
license=('GPL3')
provides=("$pkgname")
conflicts=("$pkgname")
makedepends=('go')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('2add38bbc1f12c90643824e81c786c3df14ef3ca600f6b5709451e1c6cfb9ce3b39d18543b770a809e7a20b3ec6adb0d324bc0231192393e2ee10ea138bb7128')

build() {
  cd ${pkgname}-${pkgver}
  go build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
}

