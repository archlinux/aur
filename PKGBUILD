# Maintainer: s3rj1k <evasive.gyron at gmail dot com>

pkgname=firefox-eme-free-ru-bin
_pkgname=${pkgname/-bin/}
pkgver=55.0.1
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org - EME free release (RU)'
url='http://www.mozilla.org/en-US/firefox/organizations/'
arch=('x86_64')
depends=('gtk3' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'shared-mime-info' 'gconf')
optdepends=('libgnome: fixes file association/default browser issues on GNOME desktops.'
			'gstreamer0.10: HTML5 video'
			'gstreamer0.10-good-plugins: h.264 video'
			)
provides=('firefox')
license=('MPL' 'GPL' 'LGPL')
install=$_pkgname.install
sha512sums=(
 '7017395950ed5bb55e985efdec8639116a923b7dbd2da50458dd061c0e6f1b0d4c4e179c2353c00557db04fbe9aff7512069ec2f3a716a60d5370675747a60f6'
 'b20dc825c4a0fe6a14481f0309d74a43124d28d96519ed7b83a44ba3656c3a7cbe09d6ea89e8ca941f72db58e580aaa29aeb12b9c285bffde1ff73a46396227f'
)
source=(http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}/linux-x86_64-EME-free/ru/firefox-${pkgver}.tar.bz2
        $_pkgname.desktop)

package() {
    cd $srcdir

    install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
    cp -r firefox/ $pkgdir/opt/$_pkgname

    ln -s /opt/$_pkgname/firefox $pkgdir/usr/bin/$_pkgname
    install -m644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications/
    install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/$_pkgname.png
}
