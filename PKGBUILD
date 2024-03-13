# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.0.7
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
sha256sums=('77fb15f50ff2018a27972228399ec6733df3b38415ca69188d614b5d0177614a')
b2sums=('38ad12cec9cebaa44a1302924a3565025a516800928c089f1e5ec50c5301c4b8f8864687c007c8bcda49a539bf9bb93123068200469094f3acd7829b48b80cd4')

build() {
  cd ${pkgname}-${pkgver}

  go build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
