# Maintainer: Matthias Mailänder <matthias [at] mailaender [dot] name>

pkgname=eclipse-rcptt
epoch=1
pkgver=2.5.4
pkgrel=2
pkgdesc="Eclipse RCP Testing Tool IDE"
arch=('x86_64')
url="https://eclipse.org/rcptt"
license=('EPL')
depends=('java-environment>=17')
source=("rcptt.ide-$pkgver-linux.gtk.x86_64.zip::https://www.eclipse.org/downloads/download.php?file=/rcptt/release/$pkgver/ide/rcptt.ide-$pkgver-linux.gtk.x86_64.zip&r=1"
        "eclipse-rcptt.png"
        "eclipse-rcptt.desktop")
sha512sums=('3c4120932afdef245b265ce0775fe11f075e1427d92c69e4fa71390199e1b59d5534a18cfc0fd1c38de23fa89c1627a6ece562d6c1ddb5dfcf7ad476488c6c28'
            'SKIP'
            'SKIP')

package() {
  install -d "${pkgdir}/usr/lib"
  cp -r "rcptt" "${pkgdir}/usr/lib/eclipse-rcptt"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/eclipse-rcptt/rcptt" "${pkgdir}/usr/bin/eclipse-rcptt"

  install -Dm0644 "eclipse-rcptt.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/eclipse-rcptt.png"
  install -Dm0644 "eclipse-rcptt.desktop" "${pkgdir}/usr/share/applications/eclipse-rcptt.desktop"
}
