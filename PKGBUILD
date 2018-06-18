pkgname=krudio-qml
pkgver=20180619
_git=48b7086ee2d4497b79e62810c93f4a454ad40c5b
_repo=krudio-qml
pkgrel=3
pkgdesc="Simple Qt5 QML radio player"
arch=('i686' 'x86_64')
url="https://github.com/loast/${_repo}"
license=('MIT')
makedepends=('git' 'qt5-multimedia' 'qt5-quickcontrols2' 'hicolor-icon-theme')
depends=('git' 'qt5-multimedia' 'qt5-quickcontrols2' 'hicolor-icon-theme')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz") 
md5sums=('SKIP')

package() {
    # Compiling
    cd "$srcdir/${_repo}-${_git}"
    make all
    # Build
	mkdir -p $pkgdir/usr/share/krudio-qml
	mkdir -p $pkgdir/usr/share/krudio-qml/data
	install -Dm755 $srcdir/${_repo}-${_git}/src/krudio-qml.desktop $pkgdir/usr/share/applications/krudio-qml.desktop
	install -Dm755 $srcdir/${_repo}-${_git}/src/data/* $pkgdir/usr/share/krudio-qml/data/
	install -Dm755 $srcdir/${_repo}-${_git}/src/krudio-qml $pkgdir/usr/bin/krudio-qml 
    chmod -R 777 $pkgdir/usr/share/krudio-qml
}
