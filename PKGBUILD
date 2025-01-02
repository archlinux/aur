# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
pkgname=tg-notify
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple command line interface to send notifications through Telegram Bot."
arch=('any')
url="https://github.com/liljaylj/tg-notify"
license=('MIT')
depends=('bash' 'coreutils' 'util-linux' 'sed' 'curl' 'jq')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/liljaylj/tg-notify/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('bc408224038672f6624524927c7749510c9bc5805da8cfc68a9536c3df72729e8f69db57d1e54ac0a790d5329fb175adb45e54093c98e2d927341d5421003a4b')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm644 "tgn-env.sh.example" "${pkgdir}/usr/share/doc/${pkgname}/tgn-env.sh.example"
	install -Dm755 "tg-notify" "${pkgdir}/usr/bin/tg-notify"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
