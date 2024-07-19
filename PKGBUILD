# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.0.102
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
source=("${url}/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('d02ac5dc3b59dfb45a89cb667427d2d1f69f4cc11d1912fa23c62a24fbd30565')
b2sums=('ddf882f0b12732b5d6725a21d1a2f8304eae01354d2eb48ee9ec7f3464e30fb1f169ad0c3c564b26822f937de43ecebcb9db9eb1209c4d764ddf32b056dedb76')

build() {
  cd ${pkgname}-v.${pkgver}

  go build -x
}

package() {
  cd ${pkgname}-v.${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
