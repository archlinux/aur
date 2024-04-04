# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=black-pearl-origin-bin
_realname=black-pearl-origin
pkgver=1.2.1
pkgrel=1
pkgdesc='Free and open-source tool for managing game sources using community-made modules.'
arch=('x86_64')
url='https://github.com/BlackPearlOrigin/blackpearlorigin'
license=('BSD')
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3' 'openssl-1.1')
makedepends=('binutils' 'tar')
provides=('black-pearl-origin')
conflicts=('black-pearl-origin')
source=("$url/releases/download/$pkgver/black-pearl-origin_1.1.1_amd64.deb")

sha256sums=('80964a5b0095d5c2f31311db2d9ca3e61e7e44fe8d6cc3f746bd8223197c784c')

prepare () {
	ar x "$_realname"_1.1.1_amd64.deb
	tar xvf data.tar.gz
}

package () {
   install -Dv "$srcdir/usr/bin/$_realname" "$pkgdir/usr/bin/$_realname"
   install -Dv "$srcdir/usr/share/applications/$_realname.desktop" "$pkgdir/usr/share/applications/$_realname.desktop"
   install -Dv "$srcdir/usr/share/icons/hicolor/32x32/apps/$_realname.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_realname.png"
   install -Dv "$srcdir/usr/share/icons/hicolor/128x128/apps/$_realname.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_realname.png"
   install -Dv "$srcdir/usr/share/icons/hicolor/256x256@2/apps/$_realname.png" "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/$_realname.png"
}
