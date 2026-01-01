# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
pkgname=tg-notify
pkgver=0.4.0
pkgrel=1
pkgdesc="Simple command line interface to send notifications through Telegram Bot."
arch=('any')
url="https://github.com/liljaylj/tg-notify"
license=('MIT')
depends=('bash' 'coreutils' 'util-linux' 'sed' 'curl' 'jq')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/liljaylj/tg-notify/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('023a25709591e7c307282b7eac94b817fec8c194573a4fb662f1bcce2280540e10546261e2a93095abf3ff0d848e11e1d19ce5046e8265432e32a6a3b701c81c')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm644 "tgn-env.sh.example" "${pkgdir}/usr/share/doc/${pkgname}/tgn-env.sh.example"
	install -Dm755 "tg-notify" "${pkgdir}/usr/bin/tg-notify"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
