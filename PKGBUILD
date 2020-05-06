# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=udpreplay-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Replay UDP packets from a pcap file'
arch=('x86_64')
url='https://github.com/rigtorp/udpreplay'
license=('MIT')
options=('!strip')
provides=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}::https://github.com/rigtorp/udpreplay/releases/download/v${pkgver}/udpreplay-x64-linux-static"
		'https://raw.githubusercontent.com/rigtorp/udpreplay/master/LICENSE')
sha256sums=('21d759bc1baee2d23ec7116c274b7f31b819f1d6f16e048f1dc75bb1c3b2f06f'
			'df0e31127f0e68b94da98960cbfafdbfbb3b79638cf483bf833256b216921dd3')

package() {
  install -Dm755 udpreplay* "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
# vim:set ts=2 sw=2 et: