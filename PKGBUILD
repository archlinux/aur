pkgname=camunda-modeler
pkgver=2.0.3
pkgrel=1
pkgdesc="An integrated modeling solution for BPMN and DMN based on bpmn.io"
arch=('x86_64')
url="https://camunda.org/features/modeler/"
license=('MIT')

source=("https://camunda.org/release/$pkgname/$pkgver/$pkgname-$pkgver-linux-x64.tar.gz"
        'camunda-modeler.sh'
        'camunda-modeler.desktop'
        'camunda-modeler16.png'
        'camunda-modeler48.png'
        'camunda-modeler128.png')
        
sha256sums=('3ea1f9dd7a2210d4c96b54d509e4d63e6c7d3feb22aa39f6e63e5db2d37830c5'
            '5f2f52b71d0f2e98a3e9d6bc0169cc0bdfd88eb4dd40e6837a54e0cc9275dce7'
            '1a0d59f97fd76d6a1e348170e15a7f7c3b7b85af8a66410e8338db8332971917'
            '2ada416533b6014b23ebca0b9a8615c56f0ffe5f91be798576a1aa71853b96c0'
            '6cb887a23bee04ae010937c1e25d4dd338d1b88a8f3fcc262c84ac1467d18350'
            '8480f436231efed6a5542024556b12532bf229cf000450d859a3bcaf3d59b3b1')

depends=('libnotify')

package() {
  cd "$srcdir"
  install -dm 755 "$pkgdir/opt/$pkgname"
  cp -af "$pkgname-$pkgver-linux-x64/." "$pkgdir/opt/$pkgname"
  install -dm 755 "$pkgdir/usr/bin/"
  install -Dm 775 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 "$srcdir/camunda-modeler.desktop" "$pkgdir/usr/share/applications/camunda-modeler.desktop"
  install -Dm 644 "$srcdir/camunda-modeler16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/camunda-modeler.png"
  install -Dm 644 "$srcdir/camunda-modeler48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/camunda-modeler.png"
  install -Dm 644 "$srcdir/camunda-modeler128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/camunda-modeler.png"
}

