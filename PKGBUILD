pkgname=anki
pkgver=2.0.45
pkgrel=2
pkgdesc="Helps you remember facts (like words/phrases in a foreign language) efficiently"
url="https://ankisrs.net/"
license=('AGPL3')
arch=('x86_64')
options=(!strip)
source=(https://apps.ankiweb.net/downloads/current/$pkgname-$pkgver-amd64.tar.bz2 )
sha512sums=('29ff160a3fe93e125e8d331626cec3e69adb0f6234af5a1dc74efbff35e6f4428b96b06b319a9961a8a63765aa085d40012279845f7633ad9c642532ad52b6a6')

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm644 anki.xml -t ${pkgdir}/usr/share/mime/packages/
  install -Dm644 anki.xpm anki.png -t ${pkgdir}/usr/share/pixmaps/
  install -Dm644 anki.desktop -t ${pkgdir}/usr/share/applications/
  install -Dm644 anki.1 -t ${pkgdir}/usr/share/man/man1/
  install -Dm644 README -t ${pkgdir}/usr/share/doc/anki/
  mkdir -p ${pkgdir}/opt/anki
  mkdir -p ${pkgdir}/usr/bin
  cp -ra bin ${pkgdir}/opt/anki/
  ln -s /opt/anki/bin/anki -t ${pkgdir}/usr/bin/
}
