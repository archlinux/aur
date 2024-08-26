# Maintainer: Alan Beale <the.mrabz@gmail.com>

pkgname=autobrr-bin
pkgver=1.45.0
pkgrel=1
pkgdesc="A modern download automation tool for torrents"
arch=('x86_64')
url="https://github.com/autobrr/autobrr"
license=('none')
source=("https://github.com/autobrr/autobrr/releases/download/v${pkgver}/autobrr_${pkgver}_linux_${arch}.tar.gz"
	'autobrr@.service')

sha256sums=('4a150b76b6e1a38ea4ec704ab64135b9138aa83f73a126e20c64eb6a615c0960'
            'd7cd9d0ea06f7197428df93f2a8a4b1c48fd8791da07a780e2386a0614e3d586')

package() {
	install -d "${pkgdir}"/usr/bin
	install -d "${pkgdir}"/usr/lib/systemd/system
	install -Dm755 "${srcdir}"/autobrr "${pkgdir}"/usr/bin
	install -Dm755 "${srcdir}"/autobrrctl "${pkgdir}"/usr/bin
	install -Dm 644 "autobrr@.service" -t "$pkgdir"/usr/lib/systemd/system/
}
