# Maintainer: s3rj1k <evasive.gyron at gmail dot com>

pkgname=firefox-eme-free-ru-bin
_pkgname=${pkgname/-bin/}
pkgver=54.0.1
pkgrel=2
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
 '95aea54824d9043dec49744137810fcab3fd684a09f1e135c8644bf62bf122d1d4eb9959531091c220609402b8025d9b88e91d1f1addd6c32d93aacd83e20192'
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
