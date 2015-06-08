# Maintainer: Travis Glenn Hansen <travisghansen@yahoo.com>

pkgname=ttf-selawik
pkgver=1
pkgrel=1
_commit="ec2d2ec6ab6d8a125f326a7b51f40b4a2bb22305"
pkgdesc="Selawik font as a fallback to Segoe UI"
arch=('any')
url="https://github.com/winjs/bootstrap-winjs/tree/master/src/fonts"
license=('custom')
makedepends=('fontconfig' 'xorg-font-utils')

install=ttf.install
source=(https://github.com/winjs/bootstrap-winjs/archive/${_commit}.zip)
md5sums=('f7f10fa0aa176c757ba9b7d3dd346f48')

package() {
    cd $srcdir/bootstrap-winjs-${_commit}/src/fonts
    install -D LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/COPYING
    mkdir -p $pkgdir/usr/share/fonts/TTF/
    for FILE in *.ttf; do
        install -Dm 644 "${FILE}" $pkgdir/usr/share/fonts/TTF/
    done
}
