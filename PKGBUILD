# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.0.3
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
sha256sums=('6b487cbc0dcde7635d2833ecaad05e491efefb6189abb6c6742ad9e9e227f1b0')
b2sums=('dd1a6fe8c3958a7ff7a73920f7aa67605c7e6893f33a98d6b057ced06d9c0d4989ba830a36e0ca80fd1cd914636060c261a0da00cdf71e1f378979a4d94a5682')

build() {
  cd ${pkgname}-${pkgver}

  go build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
