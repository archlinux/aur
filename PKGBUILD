# Maintainer: Matthias Mailänder <matthias [at] mailaender [dot] name>

pkgname=eclipse-rcptt-bin
epoch=1
pkgver=2.5.5
pkgrel=1
provides=(eclipse-rcptt=$pkgver-$pkgrel)
conflicts=(eclipse-rcptt)
pkgdesc="Eclipse RCP Testing Tool IDE"
arch=('x86_64')
url="https://eclipse.org/rcptt"
license=('EPL')
depends=('java-environment>=17')
source=("rcptt.ide-$pkgver-linux.gtk.x86_64.zip::https://www.eclipse.org/downloads/download.php?file=/rcptt/release/$pkgver/ide/rcptt.ide-$pkgver-linux.gtk.x86_64.zip&r=1"
        "eclipse-rcptt.png"
        "eclipse-rcptt.desktop")
sha512sums=('af84e43e7313fd68e00876608c67041e12d8f40f1a47e2083723086f0d852bc2fd797bd37f59d32588792587a17b24183414b749e6fa452e4a928927507498e3'
            'SKIP'
            'SKIP')
options=(!strip)

package() {
  install -d "${pkgdir}/usr/lib"
  cp -r "rcptt" "${pkgdir}/usr/lib/eclipse-rcptt"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/eclipse-rcptt/rcptt" "${pkgdir}/usr/bin/eclipse-rcptt"

  install -Dm0644 "eclipse-rcptt.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/eclipse-rcptt.png"
  install -Dm0644 "eclipse-rcptt.desktop" "${pkgdir}/usr/share/applications/eclipse-rcptt.desktop"
}
