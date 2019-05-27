# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>

pkgname=vr180-creator-bin
pkgver=4.0.0
pkgrel=1
pkgdesc='VR video editor and toolkit'
arch=('x86_64')
url='https://vr.google.com/vr180/apps/'
license=('MIT' 'custom:Chromium')
provides=('vr180-creator')
conflicts=('vr180-creator')
source=("$pkgname-$pkgver.tar.gz::https://storage.googleapis.com/vr180-creator/download/VR180_Creator_linux_$pkgver.tar.gz"
        'vr180-creator.desktop')
sha512sums=('a63aecd6a5b761ef3d811821839033d41e055bc6b79afc74d1ef342404a8453af6e08e39f08fda53cd5ce85deac8679138a9b4d67ac96b7c72eb370880044716'
            'a430a9f1671f392ddae11f2e5051de5c3fe3179cd2c0d37f733ec295606a263b76ca7067477f04bafed49a124113ffc07211d65b9780b2c366814a4affdde351')

package() {
  install -dm 755 "$pkgdir"/opt/vr180-creator
  cp -dr --no-preserve=ownership "$srcdir"/vr180_creator/* "$pkgdir"/opt/vr180-creator

  install -dm 755 "$pkgdir"/usr/bin
  ln -s "$pkgdir"/opt/vr180-creator/'VR180 Creator' "$pkgdir"/usr/bin/vr180-creator

  install -dm 755 "$pkgdir"/usr/share/icons
  ln -s "$pkgdir"/opt/vr180-creator/images/vr180.png "$pkgdir"/usr/share/icons/vr180.png
  install -Dm 755 "$srcdir"/vr180-creator.desktop "$pkgdir"/usr/share/applications/vr180-creator.desktop

  install -dm 644 "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$pkgdir"/opt/vr180-creator/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  ln -s "$pkgdir"/opt/vr180-creator/LICENSES.chromium.html "$pkgdir"/usr/share/licenses/$pkgname/LICENSES.chromium.html
}
