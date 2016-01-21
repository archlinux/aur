# Maintainer: Johannes Maibaum <jmaibaum@gmail.com>
pkgname=otf-libertinus
_pkgname=${pkgname/otf-/}
pkgver=6.0
pkgrel=1
pkgdesc="The Libertinus font family. A fork of the Linux Libertine and Linux Biolinum fonts with bugfixes and an OpenType math companion."
depends=('fontconfig' 'xorg-mkfontdir')
conflicts=('otf-libertine-git')
arch=('any')
license=('custom: OFL')
url="https://github.com/khaledhosny/libertinus"
install=$pkgname.install
source=("https://github.com/khaledhosny/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f73d0c1b3a64aee4ad1473458e69321d4c5bb506fca5d7975f712f9ce0f50379')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	mkdir -p $pkgdir/usr/share/fonts/OTF
	cp *.otf $pkgdir/usr/share/fonts/OTF
	install -Dm644 LICENCE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -m644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL"
}
