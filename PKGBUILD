# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="dayfolder"
pkgver="2.0.0"
pkgrel="3"
pkgdesc="DayFolder is a friend of those who like a clean desktop"
url="http://burnsoftware.wordpress.com/dayfolder/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('libappindicator3' 'hicolor-icon-theme' 'libgee06')
provides=("${pkgname}")
install="${pkgname}.install"

_source_arch="i386"
[ "$CARCH" = "x86_64" ] && _source_arch="amd64"

source=("https://launchpad.net/~thejambi/+archive/thejambi/+files/${pkgname}_${pkgver}-2_${_source_arch}.deb")
md5sums=('7ac55b142d96f360a79f266dd5d63f93')

[ "$CARCH" = "x86_64" ] && md5sums[0]='abd150310d253ab5e3e8a1769920a053'

build() {
    cd "${srcdir}"
    ar vx ${pkgname}_${pkgver}-2_${_source_arch}.deb
}

package() {
    cd "${srcdir}"
    tar -C "${pkgdir}" -xvzf data.tar.gz
    rm -rf ${pkgdir}/usr/doc && rm -rf ${pkgdir}/usr/share/doc 
}
