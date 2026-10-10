# Maintainer: Matthias Mailänder <matthias [at] mailaender [dot] name>

pkgname=eclipse-rcptt-bin
epoch=1
pkgver=2.8.2
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
sha512sums=('45da880c38a9b963d47c71758d6adceae1cb46b9f78d0017131471f6e9dc852699db739a824dafb54fd7627df993d5ebafc82d26085517b2a3373e48785278f0'
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
