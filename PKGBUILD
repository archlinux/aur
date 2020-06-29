# Maintainer: Max Shaughnessy <msh@lap.is>

pkgname=dnscontrol-bin
pkgver=3.2.0
pkgrel=2
pkgdesc="Synchronize your DNS to multiple providers from a simple DSL (binary release)"
arch=('x86_64')
url="https://stackexchange.github.io/dnscontrol/"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}::https://github.com/StackExchange/dnscontrol/releases/download/v${pkgver}/dnscontrol-Linux"
        "LICENSE::https://raw.githubusercontent.com/StackExchange/dnscontrol/v${pkgver}/LICENSE")
sha512sums=('777b1b204256eb0c29e0d117de63a2f3a3fe189d6ffd5f8d308464422c98402c01e3c63b48e468b7e0d098273b5e1e2af9e99d560f182084d47866504074064c'
	    'd268dfcfce2ffa0f1abef5334207bdd4c142a0c069d7a5a5d4863d6f2ab57fde740fe6e6270225479de564bfde78891a131d879c3d2ab29708c63f786c0e009e')

package() {
	# add bin
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"

	# add license
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}
