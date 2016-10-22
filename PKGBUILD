# Maintainer: Michal Salaban <michal@salaban.info>

pkgname=qtile-gnome
pkgver=1.0
pkgrel=1
pkgdesc='Setup qtile as window manager of GNOME 3'
arch=('any')
url='http://docs.qtile.org/en/latest/manual/config/gnome.html'
license=('CCPL')
depends=('qtile' 'gnome-session' 'gnome-settings-daemon')
install=qtile-gnome.install
source=($pkgname.desktop
        qtile.desktop
        qtile.session)
md5sums=('2a94846f22856e36c668057dc1382c1d'
         'a42d44ac89dd9c57aca7ba8c78db767e'
         '69b3b57ce3faa3901db1e935ab434961')

package() {
    cd $srcdir
    install -Dm644 $srcdir/${source[2]} $pkgdir/usr/share/gnome-session/sessions/${source[2]}
    install -Dm644 $srcdir/${source[1]} $pkgdir/usr/share/applications/${source[1]}
    install -Dm644 $srcdir/${source[0]} $pkgdir/usr/share/xsessions/${source[0]}
}

