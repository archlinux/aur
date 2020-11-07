# Maintainer: Max Shaughnessy <max@mshaugh.com>

pkgname=dnscontrol-bin
pkgver=3.4.2
pkgrel=1
pkgdesc="Synchronize your DNS to multiple providers from a simple DSL (binary release)"
arch=('x86_64')
url="https://stackexchange.github.io/dnscontrol/"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}::https://github.com/StackExchange/dnscontrol/releases/download/v${pkgver}/dnscontrol-Linux"
        "LICENSE::https://raw.githubusercontent.com/StackExchange/dnscontrol/v${pkgver}/LICENSE")
sha512sums=('b615aa9103e4ca2dcb749dde7cf3259f9d5887c3e7c58aa7097a816bf0d976b4c932fb5766551e9d5b15d425d669a0acf169ba50b84512266f3bb4959fb50e1d'
            'd268dfcfce2ffa0f1abef5334207bdd4c142a0c069d7a5a5d4863d6f2ab57fde740fe6e6270225479de564bfde78891a131d879c3d2ab29708c63f786c0e009e')

package() {
	# add bin
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"

	# add license
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}
