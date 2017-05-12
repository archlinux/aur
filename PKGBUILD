# Maintainer: Johannes Maibaum <jmaibaum@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
pkgname=otf-libertinus
_pkgname=${pkgname#*-}
pkgver=6.3
pkgrel=1
pkgdesc="The Libertinus font family. A fork of the Linux Libertine and Linux Biolinum fonts with bugfixes and an OpenType math companion."
depends=('fontconfig')
conflicts=('otf-libertine-git' 'otf-libertinus-git')
arch=('any')
license=('custom: OFL')
url="https://github.com/khaledhosny/libertinus"
source=("https://github.com/khaledhosny/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.zip")
sha256sums=('d2d61a8856000a849122b5a2767c92bf7866325e0fb0b263131a9783abf6dc4a')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	find . -name '*.otf' -execdir install -Dm644 {} $pkgdir/usr/share/fonts/OTF/{} \;
	install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL"
}
