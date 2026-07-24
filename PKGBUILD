# Maintainer: Matthias Mailänder <matthias [at] mailaender [dot] name>

pkgname=eclipse-rcptt-bin
epoch=1
pkgver=2.8.1
pkgrel=1
provides=(eclipse-rcptt=$pkgver-$pkgrel)
conflicts=(eclipse-rcptt)
pkgdesc="Eclipse RCP Testing Tool IDE"
arch=('x86_64')
url="https://eclipse.org/rcptt"
license=('EPL')
depends=('java-environment>=21')
optdepends=('libsecret: password storage'
            'webkit2gtk-4.1: HTML tooltips')
source=("rcptt.ide-$pkgver-linux.gtk.x86_64.zip::https://www.eclipse.org/downloads/download.php?file=/rcptt/release/$pkgver/ide/rcptt.ide-$pkgver-linux.gtk.x86_64.zip&r=1"
        "eclipse-rcptt.png::https://raw.githubusercontent.com/eclipse-linuxtools/org.eclipse.linuxtools.eclipse-build/refs/heads/master/desktopintegration/eclipse-rcptt.png"
        "eclipse-rcptt.desktop::https://raw.githubusercontent.com/eclipse-linuxtools/org.eclipse.linuxtools.eclipse-build/refs/heads/master/desktopintegration/eclipse-rcptt.desktop")
sha512sums=('4d7f76711df034794168efad5494c00e4b91ae3da3dd9a75419489b3b4aab18f68d9832b9016db68765b117f90a370992fb050cb9ae1cf99d3832fa77995f551'
            'df5b0fb3b465c19033bf73a9b3ca67ed0f107b1ebdedee0240952c8913a8225134717e59d74d5445b24f7fab08d20f97f7e11628d384fc4968e4869059501f74'
            '2a1419dcb0d57ef62d7af80b1d7186d23cfd13f37a5f257007654f799450b57d1ea9ba6d61bd7c213c65e7a875ae4adafcc9a0193feb81d02bfa028fb67013fd')
options=(!strip)

package() {
  install -d "${pkgdir}/usr/lib"
  cp -r "rcptt" "${pkgdir}/usr/lib/eclipse-rcptt"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/eclipse-rcptt/rcptt" "${pkgdir}/usr/bin/eclipse-rcptt"

  install -Dm0644 "eclipse-rcptt.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/eclipse-rcptt.png"
  install -Dm0644 "eclipse-rcptt.desktop" "${pkgdir}/usr/share/applications/eclipse-rcptt.desktop"
}
