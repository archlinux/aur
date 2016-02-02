# Maintainer: Travis Glenn Hansen <travisghansen@yahoo.com>

pkgname=ttf-selawik
pkgver=1
pkgrel=2
_commit="3cb4c3bdf75cfa850ad25d34d233779aa7c7aa34"
pkgdesc="Selawik font as a fallback to Segoe UI"
arch=('any')
url="https://github.com/winjs/bootstrap-winjs/tree/master/src/fonts"
license=('custom')
makedepends=('fontconfig' 'xorg-font-utils')

install=ttf.install
source=(https://github.com/winjs/bootstrap-winjs/archive/${_commit}.zip)
md5sums=('a313125537fe0f9d59e2726a5c125635')

package() {
    cd $srcdir/winstrap-${_commit}/src/fonts
    install -D LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/COPYING
    mkdir -p $pkgdir/usr/share/fonts/TTF/
    for FILE in *.ttf glyphs/*.ttf; do
        install -Dm 644 "${FILE}" $pkgdir/usr/share/fonts/TTF/
    done
}
