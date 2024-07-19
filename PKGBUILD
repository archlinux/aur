# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.0.104
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
arch=('x86_64')
license=('MIT')
makedepends=('go')
depends=('gtk4-layer-shell')
optdepends=('wl-clipboard: for clipboard module')
conflicts=('walker')
provides=('walker')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('620b93445c95a491eaa1fd10359c3f4a3048757958f9c123d6200c33c755d61a')
b2sums=('d939e852fc7545944c200c9a72cabdc85bf944d8a3eb5eab6ec4b0635043d535cf8c1c7eb05f5044a561c731633f578da6389730d34ff32a70a03ecad4b801ed')

build() {
  cd ${pkgname}-${pkgver}

  go build -x
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
