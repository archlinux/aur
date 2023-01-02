# Maintainer: teackot <k dot qovekt at gmail dot com>
_prjname=MControlCenter
pkgname=mcontrolcenter-bin
pkgver=0.3.2
pkgrel=1
pkgdesc='An application that allows you to change the settings of MSI laptops'
arch=('x86_64')
url='https://github.com/dmitry-s93/MControlCenter'
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme')
source=(https://github.com/dmitry-s93/$_prjname/releases/download/${pkgver}/${_prjname}-${pkgver}.tar.gz)
b2sums=('e62aa0348b31975d3fa14b8279e4781903b64fbbfd7f9f6068facbf7a4b8ce639af5c36f813255d089b9860f8ba5addce47d4ea8277d39c3fc1309a2f6a7fdfe')

package() {
    _binname=mcontrolcenter
    
    cd "$_prjname-$pkgver/app/"
    install -Dm755 $_binname $pkgdir/usr/bin/$_binname
    install -Dm644 $_binname.desktop $pkgdir/usr/share/applications/$_binname.desktop
    install -Dm644 $_binname.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/$_binname.svg
    install -Dm755 $_binname-helper $pkgdir/usr/libexec/$_binname-helper
    install -Dm644 $_binname-helper.conf $pkgdir/usr/share/dbus-1/system.d/$_binname-helper.conf
    install -Dm644 $_binname.helper.service $pkgdir/usr/share/dbus-1/system-services/$_binname.helper.service
}

