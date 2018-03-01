# Maintainer: Johannes Maibaum <jmaibaum@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=otf-libertinus
_pkgname=${pkgname#*-}
pkgver=6.4
pkgrel=1
pkgdesc='The Libertinus font family. A fork of the Linux Libertine and Linux Biolinum fonts with bugfixes and an OpenType math companion.'
depends=('fontconfig')
conflicts=('otf-libertine-git' 'otf-libertinus-git')
arch=('any')
license=('custom: OFL')
url='https://github.com/khaledhosny/libertinus'
source=("https://github.com/khaledhosny/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.zip")
sha256sums=('1e7b8644082bd5f4c64c3bce0322c8aa419034950302ca5103a67df6cf81f1ec')

package() {
	cd "${_pkgname}-${pkgver}"
	find . -name '*.otf' -execdir install -Dm644 {} $pkgdir/usr/share/fonts/OTF/{} \;
	install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL"
}
