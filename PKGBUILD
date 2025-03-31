# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
pkgname=tg-notify
pkgver=0.3.2
pkgrel=1
pkgdesc="Simple command line interface to send notifications through Telegram Bot."
arch=('any')
url="https://github.com/liljaylj/tg-notify"
license=('MIT')
depends=('bash' 'coreutils' 'util-linux' 'sed' 'curl' 'jq')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/liljaylj/tg-notify/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('37785732f5f70fa46dd66443d355aef3ac24622c4c73e71616411e3994c25d6624958d1e49fca878659ce5e66db2fbe1bf382f06ac32426d1777a0a42205692f')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm644 "tgn-env.sh.example" "${pkgdir}/usr/share/doc/${pkgname}/tgn-env.sh.example"
	install -Dm755 "tg-notify" "${pkgdir}/usr/bin/tg-notify"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
