# Maintainer: Matthias Mailänder <matthias [at] mailaender [dot] name>

pkgname=eclipse-rcptt-bin
epoch=1
pkgver=2.7.1
pkgrel=1
provides=(eclipse-rcptt=$pkgver-$pkgrel)
conflicts=(eclipse-rcptt)
pkgdesc="Eclipse RCP Testing Tool IDE"
arch=('x86_64')
url="https://eclipse.org/rcptt"
license=('EPL')
depends=('java-environment>=21')
source=("rcptt.ide-$pkgver-linux.gtk.x86_64.zip::https://cdimage.debian.org/mirror/eclipse.org/rcptt/release/$pkgver/ide/rcptt.ide-$pkgver-linux.gtk.x86_64.zip"
        "eclipse-rcptt.png::https://raw.githubusercontent.com/eclipse-linuxtools/org.eclipse.linuxtools.eclipse-build/refs/heads/master/desktopintegration/eclipse-rcptt.png"
        "eclipse-rcptt.desktop::https://raw.githubusercontent.com/eclipse-linuxtools/org.eclipse.linuxtools.eclipse-build/refs/heads/master/desktopintegration/eclipse-rcptt.desktop")
sha512sums=('20793d80207062c71ebdb55e09dabcbc81ed41e4f34a117d3985e36d973a26565e2e3eba9a3572914907d5bd2f63912f5dedd62960b352f8b8ce68a9cbab3e43'
            'df5b0fb3b465c19033bf73a9b3ca67ed0f107b1ebdedee0240952c8913a8225134717e59d74d5445b24f7fab08d20f97f7e11628d384fc4968e4869059501f74'
            '002a074ce1a41bc84bf688c21e3e8e94ba4662b167f459e5cc46397434565fab30520cc78e062407ac7eaba73d84604ff2d16aa27c3aa2d39cc9aea27d969d8c')
options=(!strip)

package() {
  install -d "${pkgdir}/usr/lib"
  cp -r "rcptt" "${pkgdir}/usr/lib/eclipse-rcptt"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/eclipse-rcptt/rcptt" "${pkgdir}/usr/bin/eclipse-rcptt"

  install -Dm0644 "eclipse-rcptt.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/eclipse-rcptt.png"
  install -Dm0644 "eclipse-rcptt.desktop" "${pkgdir}/usr/share/applications/eclipse-rcptt.desktop"
}
