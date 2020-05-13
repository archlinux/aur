# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=leaps-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="A service for collaboratively editing your local files over a web UI, using operational transforms to ensure zero-collision synchronization across any number of editing clients"
arch=('x86_64')
url='https://github.com/Jeffail/leaps'
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/leaps_linux_amd64.tar.gz"
				'LICENSE::https://github.com/Jeffail/leaps/raw/master/LICENSE')
sha256sums=('81a4dbb42fecf25b6728ba6ebc1225bb2e65ae949e8d0827e629c95acd463765'
						'd99e66b5a0878e428224b79a363078ad9c5d3c5545c881b6fc9fecb23d15c7db')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}_linux_amd64/bin/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}