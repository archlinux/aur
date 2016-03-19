# Maintainer: Tae Sandoval <taecilla@users.noreply.github.com>

pkgname=nodequery
pkgver=0.7.7
pkgrel=1
pkgdesc="A lightweight and easy to use Linux server monitoring service."
arch=('any')
url="https://nodequery.com"
license=('MIT')
depends=('wget')
install=$pkgname.install
source=(
	$pkgname-$pkgver.sh
	$pkgname.service
	$pkgname.timer
	LICENSE
)
sha256sums=(
	'9c213ffc655e7591add8231a8c45536d7c16ce975004d73494bb431b731e8f06'
	'f65e6444204d4abe45348ce7ebbc01e8cdd5373f6655833383ffe22afcb79e08'
	'dd8268a04f6cd0cd20a697c9bbadf02945660fabbf2b8ab2f872ec19914b8bc2'
	'5a7a4287d7ab9b40b09094cce2f0ba7899a8f3cce0f14c794ea968a93bdeab42'
)

package() {
	install -D "${srcdir}/${pkgname}-${pkgver}.sh" "${pkgdir}/etc/${pkgname}/nq-agent.sh"
	install -Dm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dm 644 "${srcdir}/${pkgname}.timer" "${pkgdir}/usr/lib/systemd/system/${pkgname}.timer"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
