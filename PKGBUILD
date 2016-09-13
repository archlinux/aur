# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=zandronum-hg
pkgver=0.0000001
pkgrel=1
pkgdesc="OpenGL ZDoom port with Client/Server multiplayer. (Development branch checkout)"
arch=('i686' 'x86_64')
url="https://zandronum.com"
license=('custom')
depends=('sdl libjpeg6-turbo glu openssl fluidsynth')
optdepends=('timidity++: midi support')
makedepends=('gcc')
_pkgname=zandronum
provides=("zandronum")
conflicts=("zandronum")
install=
changelog=
noextract=()
source=("zandronum::hg+https://bitbucket.org/Torr_Samaho/zandronum")
# see https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git_Submodules if you require git submodules
sha512sums=('SKIP')
pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}
build() {
        cd "${srcdir}/${_pkgname}/src"
        make prefix=${pkgdir}/usr
}
package() {
        install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
        install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
