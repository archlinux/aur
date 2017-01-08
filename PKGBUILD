# Maintainer: Johannes Maibaum <jmaibaum@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
pkgname=otf-libertinus
_pkgname=${pkgname#*-}
pkgver=6.2
pkgrel=5
pkgdesc="The Libertinus font family. A fork of the Linux Libertine and Linux Biolinum fonts with bugfixes and an OpenType math companion."
depends=('fontconfig')
conflicts=('otf-libertine-git' 'otf-libertinus-git')
arch=('any')
license=('custom: OFL')
url="https://github.com/khaledhosny/libertinus"
source=("https://github.com/khaledhosny/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.zip")
sha256sums=('3927bca361b893e042170dcfa56bc1c4fc5ec1b44bfc37d6ccc04b4b4fad82e7')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	find . -name '*.otf' -execdir install -Dm644 {} $pkgdir/usr/share/fonts/OTF/{} \;
	install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL"
}
