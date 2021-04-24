# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=reproxy-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Simple edge server/reverse proxy"
arch=('x86_64')
url='http://reproxy.io'
license=('MIT')
provides=('reproxy')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/umputun/reproxy/releases/download/v${pkgver}/reproxy_v${pkgver}_linux_x86_64.tar.gz"
		"reproxy-example.yml::https://github.com/umputun/reproxy/raw/master/reproxy-example.yml"
		"reproxy.service::https://github.com/umputun/reproxy/raw/master/reproxy.service")
sha256sums=('1986ac60140a91adbe893d8673ef0656ad8b24c719df0c5e2bae617c623016c0'
            'd5076b9c09086efe6a7808540b9bd150b5e0a19435d545db704b9cb7c26a3e2c'
            'cdb0ee780e5500e45ab25d302e781250acffdffb6a829c5d84a7f2223f84e5eb')

package() {
  install -Dm755 ${srcdir}/reproxy -t "${pkgdir}/usr/bin/"
  install -Dm644 ${srcdir}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 ${srcdir}/reproxy.service -t "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 ${srcdir}/reproxy-example.yml -t "${pkgdir}/etc/reproxy/"
}
