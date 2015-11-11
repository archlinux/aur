# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Manuel Carreira <arch@carreira.com.pt>
pkgname=ws
pkgver=0.6.3
_pkgver=0.6-3
pkgrel=3
pkgdesc="Mounts windows shares available in network"
arch=('any')
url="http://winshares.sourceforge.net/"
license=('GPL')
depends=('samba>=3.0.20-2' 'sudo' 'gawk' 'sed')
install=INSTALL
source=(http://downloads.sourceforge.net/project/winshares/winshares/Winshares%20${_pkgver}/${pkgname}-${_pkgver}.tar.gz
    arch.patch)
md5sums=('bff300695cad6b66cab68ca5935a8062'
       'b76f7bd9dc490f787f202211681b7c65')

package() {
  cd "$srcdir/$pkgname-$_pkgver"
  patch -p1 < ../arch.patch
  
  install -o 0 -g 0 -d -m 0755 $pkgdir/usr/bin
  install -o 0 -g 0 -d -m 0755 $pkgdir/usr/share/applications
  install -o 0 -g 0 -d -m 0755 $pkgdir/usr/share/pixmaps
  install -o 0 -g 0 -d -m 0755 $pkgdir/usr/share/locale/pt/LC_MESSAGES
  install -o 0 -g 0 -d -m 0755 $pkgdir/usr/share/locale/pt_PT/LC_MESSAGES
  install -o 0 -g 0 -d -m 0755 $pkgdir/usr/share/man/man1 
  install -o 0 -g 0 -d -m 0755 $pkgdir/usr/share/man/man5
  install -o 0 -g 0 -d -m 0755 $pkgdir/usr/share/man/man8
  install -o 0 -g 0 -d -m 0755 $pkgdir/usr/share/man/pt/man1
  install -o 0 -g 0 -d -m 0755 $pkgdir/usr/share/man/pt_PT/man1
  install -o 0 -g 0 -d -m 0755 $pkgdir/usr/share/man/pt/man5
  install -o 0 -g 0 -d -m 0755 $pkgdir/usr/share/man/pt_PT/man5
  install -o 0 -g 0 -d -m 0755 $pkgdir/usr/share/man/pt/man8
  install -o 0 -g 0 -d -m 0755 $pkgdir/usr/share/man/pt_PT/man8
  install -o 0 -g 0 -d -m 0755 $pkgdir/usr/share/doc/$pkgname-$pkgver

  install -m 750 ws-auto $pkgdir/usr/bin/ws-auto
  install -m 755 ws $pkgdir/usr/bin/ws
  install -m 750 ws-confsudo $pkgdir/usr/bin/ws-confsudo
  install -m 0644 locale/pt.mo $pkgdir/usr/share/locale/pt/LC_MESSAGES/ws.mo
  install -m 0644 locale/pt_PT.mo $pkgdir/usr/share/locale/pt_PT/LC_MESSAGES/ws.mo
  install -m 644 ws-on.desktop $pkgdir/usr/share/applications/ws-on.desktop
  install -m 644 ws-off.desktop $pkgdir/usr/share/applications/ws-off.desktop
  install -m 644 ws_close.png $pkgdir/usr/share/pixmaps/ws_close.png
  install -m 644 ws_open.png $pkgdir/usr/share/pixmaps/ws_open.png
  install -m 644 DOCS/ws.1.gz $pkgdir/usr/share/man/man1/ws.1.gz
  install -m 644 DOCS/ws.pt.1.gz $pkgdir/usr/share/man/pt/man1/ws.1.gz
  install -m 644 DOCS/ws.pt_PT.1.gz $pkgdir/usr/share/man/pt_PT/man1/ws.1.gz
  install -m 644 DOCS/ws.conf.5.gz $pkgdir/usr/share/man/man5/ws.conf.5.gz
  install -m 644 DOCS/ws.conf.pt.5.gz $pkgdir/usr/share/man/pt/man5/ws.conf.5.gz
  install -m 644 DOCS/ws.conf.pt_PT.5.gz $pkgdir/usr/share/man/pt_PT/man5/ws.conf.5.gz
  install -m 644 DOCS/ws-utils.8.gz $pkgdir/usr/share/man/man8/ws-utils.8.gz
  install -m 644 DOCS/ws-utils.pt.8.gz $pkgdir/usr/share/man/pt/man8/ws-utils.8.gz
  install -m 644 DOCS/ws-utils.pt_PT.8.gz $pkgdir/usr/share/man/pt_PT/man8/ws-utils.8.gz
  install -m 644 COPYING $pkgdir/usr/share/doc/$pkgname-$pkgver/COPYING
  install -m 644 ChangeLog $pkgdir/usr/share/doc/$pkgname-$pkgver/ChangeLog
  install -m 644 FAQ $pkgdir/usr/share/doc/$pkgname-$pkgver/FAQ
  install -m 644 INSTALL $pkgdir/usr/share/doc/$pkgname-$pkgver/INSTALL
  install -m 644 MANIFEST $pkgdir/usr/share/doc/$pkgname-$pkgver/MANIFEST
  install -m 644 README $pkgdir/usr/share/doc/$pkgname-$pkgver/README
  install -m 644 TODO $pkgdir/usr/share/doc/$pkgname-$pkgver/TODO
  install -m 644 DOCS/ws.conf.example $pkgdir/usr/share/doc/$pkgname-$pkgver/ws.conf.example
  install -m 644 ws.po $pkgdir/usr/share/doc/$pkgname-$pkgver/ws.po
    
}

# vim:set ts=2 sw=2 et:
