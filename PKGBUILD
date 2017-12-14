# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=zandronum
pkgver=3.0
pkgrel=1
pkgdesc="OpenGL ZDoom port with Client/Server multiplayer"
arch=( 'i686' 'x86_64' )
url="https://zandronum.com/"
license=( 'CUSTOM' )
depends=( 'sdl' 'libjpeg6-turbo' 'glu' 'openssl' 'fluidsynth' )
optdepends=( 'timidity++: midi support' 'freedoom: free IWAD' 'gtk2: for a GUI selection screen' )
makedepends=( 'zlib' 'sdl' 'libjpeg-turbo' 'nasm' 'gtk2' 'cmake' 'mercurial' 'fluidsynth' 'mesa' 'glu' )
_pkgname=zandronum
conflicts=( 'pkg''pkg''pkg')
install=
changelog=
noextract=()
source=("https://zandronum.com/downloads/zandronum3.0-linux-x86_64.tar.bz2"
        "zandronum3.0-linux-x86_64.tar.bz2.sig")
sha512sums=('830985bbea92c5519c50fbda839da7cebf35af7969d550c3e3d3f829fdb2d693c599d7d7f06ba977cb0cbb6973fa05c30cd06ff20293d5679688c9ea0b1392cc'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
