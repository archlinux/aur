# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=aif
pkgver=0.01
_pkgver=${pkgver}-BETA # currently at beta release
pkgrel=2
pkgdesc="An XML and python-driven rebirth of the AIF (Arch Installation Framework) project."
arch=( 'i686' 'x86_64' )
url="https://aif.square-r00t.net/"
license=( 'GPL3' )
depends=( 'python' 'arch-install-scripts' 'parted' 'gptfdisk' )
optdepends=( 'python-lxml: better XML handling' )
_pkgname=AIF-NG
conflicts=( 'aif-git' )
install=
changelog=
noextract=()
source=("${pkgname}-${pkgver}.tar.xz::https://git.square-r00t.net/${_pkgname}/snapshot/${_pkgname}-${_pkgver}.tar.xz"
        "${pkgname}-${pkgver}.tar.xz.sig")
sha512sums=('ed98f77116f80a06405a0be9efeecb2d0f78ff702577d0f7f8f407210c50316106a602cef28f3bbd11989a62c53062874d1c292fc7f713450a11289559ec5885'
            'SKIP')
package() {
        install -D -m0755 ${srcdir}/${_pkgname}-${_pkgver}/${pkgname}client.py ${pkgdir}/usr/bin/${pkgname}
        install -D -m0755 ${srcdir}/${_pkgname}-${_pkgver}/${pkgname}verify.py ${pkgdir}/usr/bin/${pkgname}-verify
        install -D -m0644 ${srcdir}/${_pkgname}-${_pkgver}/${pkgname}.xml ${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.xml
        install -D -m0644 ${srcdir}/${_pkgname}-${_pkgver}/${pkgname}.xsd ${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.xsd
        install -D -m0644 ${srcdir}/${_pkgname}-${_pkgver}/HOWTO ${pkgdir}/usr/share/doc/${pkgname}/HOWTO
        install -D -m0644 ${srcdir}/${_pkgname}-${_pkgver}/TODO ${pkgdir}/usr/share/doc/${pkgname}/TODO
	# TODO: xml linter, script samples. and docs, when i write them.
}
