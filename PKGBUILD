# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.0.51
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
arch=('x86_64')
license=('MIT')
makedepends=('go')
depends=('gtk4-layer-shell')
optdepends=('fd: for finder module'
            'fzf: for finder module'
            'wl-clipboard: for clipboard module')
conflicts=('walker')
provides=('walker')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d33611018070153dcd4a539c7e41a22dfa546fa678c60478021af3879b816a0f')
b2sums=('3bcf30a6d479a083b7f27113b839c38566a4d58548ea972abaa837ad1137ac796b30f1480dd448eebd79c12b441a2ac399ef897f786dcfed09ec04e36b430132')

build() {
  cd ${pkgname}-${pkgver}

  go build -x
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 walker -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
