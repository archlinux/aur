# Maintainer: VanillaGreen <brad@vanillagreen.com>
pkgname=vsys
pkgver=0.10.0
pkgrel=1
pkgdesc="Terminal dashboard for Linux machines that run AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/vanillagreencom/vsys"
license=('MIT')
depends=('python' 'systemd-libs')
provides=('vsys')
conflicts=('vsys-git')
options=('!strip' '!debug')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/vsys-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/vsys-v${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('558ca529e3ef447cb507fbc35c7419fc97affd36f6ad848c338c1ec553cf6243')
sha256sums_aarch64=('93481543362c0b08d736ba39e2f44c7e247336c970de58c095bc67f731db95e2')

package() {
	install -Dm755 "${srcdir}/vsys" "${pkgdir}/usr/bin/vsys"
	install -d "${pkgdir}/usr/lib"
	cp -R --no-preserve=ownership "${srcdir}/lib/vsys" "${pkgdir}/usr/lib/"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
