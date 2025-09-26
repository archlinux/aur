# Maintainer: Matthias Mailänder <matthias [at] mailaender [dot] name>

pkgname=eclipse-rcptt-bin
epoch=1
pkgver=2.6.0
pkgrel=1
provides=(eclipse-rcptt=$pkgver-$pkgrel)
conflicts=(eclipse-rcptt)
pkgdesc="Eclipse RCP Testing Tool IDE"
arch=('x86_64')
url="https://eclipse.org/rcptt"
license=('EPL')
depends=('java-environment>=21')
source=("rcptt.ide-$pkgver-linux.gtk.x86_64.zip::https://www.eclipse.org/downloads/download.php?file=/rcptt/release/$pkgver/ide/rcptt.ide-$pkgver-linux.gtk.x86_64.zip&r=1"
        "eclipse-rcptt.png"
        "eclipse-rcptt.desktop")
sha512sums=('b9bbaeb595553a70eff3ba231292cb55d78a1371fbba35da84f78fa18624d7b7a1266cd618c971f84f1742224380b22d0c776c7365676b624fe57ab557df6a9e'
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
