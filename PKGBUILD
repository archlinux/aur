# Maintainer: Sanya Rajan <$(echo "c2FueWFyYWphbkBnbWFpbC5jb20K" | base64 -d)>
# Contributor: Edison Ibañez <edison@opmbx.org>
pkgname=camunda-modeler-alpha-bin
pkgver=1.12.0_alpha_5
pkgrel=1
pkgdesc="An integrated modeling solution for BPMN and DMN based on bpmn.io"
arch=('i686' 'x86_64')
url="https://camunda.org/features/modeler/"
license=('MIT')

conflicts=('camunda-modeler')

_packagename=camunda-modeler
_packageversion=1.12.0-alpha-5

source=('camunda-modeler.sh'
        'camunda-modeler.desktop'
        'camunda-modeler16.png'
        'camunda-modeler48.png'
        'camunda-modeler128.png')
source_x86_64=("https://camunda.org/release/$_packagename/$_packageversion/$_packagename-$_packageversion-linux-x64.tar.gz")
source_i686=("https://camunda.org/release/$_packagename/$_packageversion/$_packagename-$_packageversion-linux-ia32.tar.gz")
md5sums=('9580e90224bd893ea6e070e399b25b01'
         'd13db3466242d0ab85e0152f3ceccded'
         'bc08d6679ab052bd7c936954f0a8d97c'
         '2d041c2f1a6cafa0d0079d207eb635fd'
         '22f05a8460e7b0d823dc65a2ee3f5a0e')
md5sums_i686=('5786a177bbc0f8dd8db5dd224e19ba4c')
md5sums_x86_64=('294adefaaf7177390e9f440f79a232e2')

depends=('libnotify')

package() {
  cd "$srcdir"
  install -dm 755 "$pkgdir/opt/$_packagename"
  cp -rf "$_packagename" "$pkgdir/opt"
  install -dm 755 "$pkgdir/usr/bin/"
  install -Dm 775 "$_packagename.sh" "$pkgdir/usr/bin/$_packagename"
  install -Dm 644 "$srcdir/camunda-modeler.desktop" "$pkgdir/usr/share/applications/camunda-modeler.desktop"
  install -Dm 644 "$srcdir/camunda-modeler16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/camunda-modeler.png"
  install -Dm 644 "$srcdir/camunda-modeler48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/camunda-modeler.png"
  install -Dm 644 "$srcdir/camunda-modeler128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/camunda-modeler.png"
}


