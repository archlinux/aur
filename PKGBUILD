# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
pkgname=tg-notify
pkgver=0.1.1
pkgrel=1
pkgdesc="Command line interface to send notifications through Telegram Bot."
arch=('any')
url="https://github.com/liljaylj/tg-notify"
license=('MIT')
depends=('bash' 'coreutils' 'util-linux' 'sed' 'curl' 'jq')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/liljaylj/tg-notify/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('306a6217be44e050ae116a9f212215e4d87fe22531f617c68efcf73ffdd727c2d293d79b35c1612c93837a2d032fe2972426f126c463b72099d0c56cc2b909f0')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm644 "tgn-env.sh.example" "${pkgdir}/usr/share/doc/${pkgname}/tgn-env.sh.example"
	install -Dm755 "tg-notify" "${pkgdir}/usr/bin/tg-notify"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
