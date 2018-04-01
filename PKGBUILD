# Maintainer: Tran Duc Nam <dynamo.foss@gmail.com>

pkgname=awesome-gnome
pkgver=2.2
pkgrel=1
pkgdesc='Setup awesome as window manager of GNOME 3'
arch=('any')
url='http://awesome.naquadah.org/wiki/Quickly_Setting_up_Awesome_with_Gnome'
license=('CCPL')
depends=('awesome' 'gnome-session>=3.28' 'gnome-settings-daemon>=3.28' 'notification-daemon')
install=awesome-gnome.install
source=($pkgname.desktop
        awesome.desktop
        awesome.session)
md5sums=('33833f966597ae644bdc927750409b78'
         'ae7d8d0426c36c8c6f606cf28f13ac02'
         '1f809e791319a41f0ab7cb1698184c54')

package() {
    cd $srcdir
    install -Dm644 $srcdir/${source[2]} $pkgdir/usr/share/gnome-session/sessions/${source[2]}
    install -Dm644 $srcdir/${source[1]} $pkgdir/usr/share/applications/${source[1]}
    install -Dm644 $srcdir/${source[0]} $pkgdir/usr/share/xsessions/${source[0]}
}

