# Maintainer: Albert Graef <aggraef@gmail.com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=touchosc-editor
pkgver=1.8.9
pkgrel=2
pkgdesc='Graphical layout editor for TouchOSC'
arch=(any)
url=http://hexler.net
license=(custom:TouchOSC)
depends=(java-runtime hicolor-icon-theme sh)
source=(http://hexler.net/pub/touchosc/$pkgname-$pkgver-noarch.zip
        $pkgname.sh
        $pkgname.png
        $pkgname.desktop
        touchosc-layout.png
        touchosc-layout.xml)
sha512sums=('fbf4527a427ad18bc2742c9ace1aad696351f4892c03055e6e4dba88f1faa1ba4612f6af14814ab109203bba75b0946ade96a385b020ec1a0d64d6d60e24e66f'
            'd2c3d8ea58b55e741d0faea9e8f496632dccf72694890792e16186311577f672603821e99a39c1dd738ec7fd8bb039e3c4ee99f385188665f89b78c215475ec8'
            '46c40c206ec3724a5cb35930034c4ab84c89fa821bf2545ed56f2c4328ff16add8977df81135c5637caff65ce3d78ea90166dd19ca76e19b3dd8e2f1123c5753'
            '0305480de62b6cc5ca418927d3f33e5ef23a9f751ec29ca422c5d83109198e7d90a4de95dd4d5cd7baf0e4767cc77e8fd33fd08c481f90a9b451d46b215cb2c4'
            '95bf18b6108079c30aa5851d50bf9138c3894fce1bed73848720bd20d1133f5fa0af61b4c32e8190f2ff5d4c3739f589efb153a10f94a82fc561e6db0a92d4e2'
            'd9e9e38b78c618e45dbd2999e2558fd7a33c62878a6e6ba785eaf4385d0cbc47242631d95b2c49ed134f703da893a0010d9990be4d553eae2499c9d7a3d60dec')

package() {
  cd $pkgname-$pkgver-noarch

  install -Dm 644 TouchOSCEditor.jar -t "$pkgdir"/usr/share/java/
  install -Dm 644 layouts/* -t $pkgdir/usr/share/$pkgname/layouts
  install -Dm 644 README.txt -t $pkgdir/usr/share/licenses/$pkgname

  cd ..

  install -D $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm 644 $pkgname.desktop -t "$pkgdir"/usr/share/applications
  install -Dm 644 $pkgname.png -t "$pkgdir"/usr/share/icons/hicolor/128x128/apps
  install -Dm 644 touchosc-layout.png -t "$pkgdir"/usr/share/icons/hicolor/128x128/mimetypes
  install -Dm 644 touchosc-layout.xml -t "$pkgdir"/usr/share/mime/packages
}
