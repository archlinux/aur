# Maintainer: Edison Ibañez <edison@opmbx.org>
pkgname=camunda-modeler
pkgver=1.4.0
pkgrel=1
pkgdesc="An integrated modeling solution for BPMN and DMN based on bpmn.io"
arch=('i686' 'x86_64')
url="https://camunda.org/features/modeler/"
license=('MIT')

source=('camunda-modeler.sh'
        'camunda-modeler.desktop'
        'camunda-modeler16.png'
        'camunda-modeler48.png'
        'camunda-modeler128.png')
source_x86_64=("https://camunda.org/release/$pkgname/$pkgver/$pkgname-$pkgver-linux-x64.tar.gz")
source_i686=("https://camunda.org/release/$pkgname/$pkgver/$pkgname-$pkgver-linux-ia32.tar.gz")
md5sums=('9580e90224bd893ea6e070e399b25b01'
         'd13db3466242d0ab85e0152f3ceccded'
         'bc08d6679ab052bd7c936954f0a8d97c'
         '2d041c2f1a6cafa0d0079d207eb635fd'
         '22f05a8460e7b0d823dc65a2ee3f5a0e')
md5sums_i686=('108980faa4c322fcf88cc5cb2faea44f')
md5sums_x86_64=('69474bd9a617869a21388b64e6c60d9e')


depends=('libnotify')

package() {
  cd "$srcdir"
  install -dm 755 "$pkgdir/opt/$pkgname"
  cp -rf "$pkgname" "$pkgdir/opt"
  install -dm 755 "$pkgdir/usr/bin/"
  install -Dm 775 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 "$srcdir/camunda-modeler.desktop" "$pkgdir/usr/share/applications/camunda-modeler.desktop"
  install -Dm 644 "$srcdir/camunda-modeler16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/camunda-modeler.png"
  install -Dm 644 "$srcdir/camunda-modeler48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/camunda-modeler.png"
  install -Dm 644 "$srcdir/camunda-modeler128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/camunda-modeler.png"
}

# vim:set ts=2 sw=2 et:
