# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.0.17
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
arch=('x86_64')
license=('MIT')
makedepends=('go')
depends=('gtk4-layer-shell')
conflicts=('walker')
provides=('walker')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('02ffe1a9e5f316f177d2cbc627d3e69cf8a230a180c4293a66ed15022a610bdf')
b2sums=('3b0699c5d8c8fec50bca1d067ed5abae00de377f2cbc29bf2a0920f3fb95ac23f09e4e6f8be1b083b6af5115cdc87e71029ab5a5a31f04b469785ad253dfa368')

build() {
  cd ${pkgname}-${pkgver}

  go build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
