# Maintainer: Callum Andrew

pkgname=hooroo
pkgver=0.2
pkgrel=1
pkgdesc='Synchronise your pacman and flatpak packages with files'
arch=('any')
url="https://github.com/ca-cl2/${pkgname}"
license=('Apache')
depends=('bash')
provides=("$pkgname")
source=("https://github.com/ca-cl2/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4d0a88a279023212b72a1da178b9da98ce4c9cc6ce13e07c202db391b34c536e')

package() {
	install -Dm755 "${pkgname}-${pkgver}/$pkgname" -t "${pkgdir}/usr/bin"
	install -Dm644 "${pkgname}-${pkgver}/$pkgname.hook" -t "${pkgdir}/usr/share/libalpm/hooks"
	install -Dm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
