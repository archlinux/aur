# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.0.5
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
arch=('x86_64')
license=('MIT')
makedepends=('go')
depends=('gtk4')
conflicts=('walker')
provides=('walker')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('574e2465c9fa6a4b4d2ba7f0f2022585022d0c262e4967bb581c5c5043d7e61b')
b2sums=('0ec294edda47c27d19924935ffef0a5b045213d300fb4dd03abb3841f5c8c0c5cc8926a3d74725de83be7a79dac947d6d33e07baeac9048f37cb1f41925cdda0')

build() {
  cd ${pkgname}-${pkgver}

  go build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
