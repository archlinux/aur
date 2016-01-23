# Maintainer: Johannes Maibaum <jmaibaum@gmail.com>
pkgname=otf-libertinus
_pkgname=${pkgname#*-}
pkgver=6.1
pkgrel=2
pkgdesc="The Libertinus font family. A fork of the Linux Libertine and Linux Biolinum fonts with bugfixes and an OpenType math companion."
depends=('fontconfig' 'xorg-mkfontdir')
conflicts=('otf-libertine-git' 'otf-libertinus-git')
arch=('any')
license=('custom: OFL' 'GPL')
url="https://github.com/khaledhosny/libertinus"
install=$pkgname.install
source=("https://github.com/khaledhosny/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2c5a32e08d7601ffdc86e52d69dc1d19acfd118ec5bb549073a3cbeb969e74be')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	find . -name '*.otf' -execdir install -Dm644 {} $pkgdir/usr/share/fonts/OTF/{} \;
	install -Dm644 LICENCE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -m644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-OFL"
	install -m644 GPL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-GPL"
}
