# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=zandronum-bin
pkgver=3.0.1
pkgrel=1
pkgdesc="OpenGL ZDoom port with Client/Server multiplayer (Binary release)"
arch=( 'i686' 'x86_64' )
url="https://zandronum.com/"
license=( 'CUSTOM' )
depends=( 'sdl' 'libjpeg-turbo' 'glu' 'openssl-1.0' 'fluidsynth' 'fmodex' )
optdepends=( 'timidity++: midi support' 'freedoom: free IWAD' 'gtk2:for a GUI selection screen' 'doomseeker: a GUI server browser' )
_pkgname=zandronum-bin
conflicts=( 'pkg''pkg')
install=
changelog=
noextract=()
source=("https://zandronum.com/downloads/zandronum3.0.1-linux-x86_64.tar.xz"
        "zandronum3.0.1-linux-x86_64.tar.xz.sig")
sha512sums=('d09106cc7444f61abea8e07e4ea9d009b9e1e3e2e86c8f2f0320dcbe1636eda5abe2a44ba995fbb7b58c32ca43d79cb6f33ee0e54b4b9d33998a1fa3a2ea58a8'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
