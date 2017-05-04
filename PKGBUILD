# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=aif
pkgver=0.01
pkgrel=1
pkgdesc="An XML and python-driven rebirth of the AIF (Arch Installation Framework) project."
arch=( 'i686' 'x86_64' )
url="https://aif.square-r00t.net/"
license=( 'GPL3' )
depends=( 'python' 'arch-install-scripts' 'parted' 'gptfdisk' )
optdepends=( 'python-lxml' )
_pkgname=aif
conflicts=( 'pkg''pkg')
install=
changelog=
noextract=()
source=("https://git.square-r00t.net/AIF-NG/snapshot/AIF-NG-0.01-BETA.tar.xz"
        "AIF-NG-0.01-BETA.tar.xz.sig")
sha512sums=('ed98f77116f80a06405a0be9efeecb2d0f78ff702577d0f7f8f407210c50316106a602cef28f3bbd11989a62c53062874d1c292fc7f713450a11289559ec5885'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
