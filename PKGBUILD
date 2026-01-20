# Maintainer: Matthias Mailänder <matthias [at] mailaender [dot] name>

pkgname=eclipse-rcptt-bin
epoch=1
pkgver=2.7.2
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
sha512sums=('7140735b2c7ea075ca36c932bfdcfba2d1e12b14937085f3a848e231d5b900af036f50d03e0c33cb0fd1c68cb332961d2d1d8725dfe99a2fd97ab5f76d4aba85'
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
