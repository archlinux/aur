# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
pkgname=tg-notify
pkgver=0.1.0
pkgrel=1
pkgdesc="Command line interface to send notifications through Telegram Bot."
arch=('any')
url="https://github.com/liljaylj/tg-notify"
license=('MIT')
depends=('bash' 'coreutils' 'util-linux' 'sed' 'curl' 'jq')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/liljaylj/tg-notify/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('732cc34731526e5d94ee59a36c132ca860d078511f70af785d40538c78fcd6da2106ccb3abfacfd8434787ba0a862ed41e76bb462c0bad9e1245c69f005cdfd6')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm644 "tgn-env.sh.example" "${pkgdir}/usr/share/doc/${pkgname}/tgn-env.sh.example"
	install -Dm755 "tg-notify" "${pkgdir}/usr/bin/tg-notify"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
