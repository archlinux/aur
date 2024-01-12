# Maintainer: saxonbeta <saxonbeta at gmail>
# Contributor: Will Price <will.price94@gmail.com>

pkgname=vosviewer
_pkgname=VOSviewer
pkgver=1.6.20
pkgrel=1
pkgdesc="Software tool for constructing and visualizing bibliometric networks"
arch=('any')
url="https://www.vosviewer.com"
license=('GPL')
depends=('java-runtime')
source=("${url}/downloads/${_pkgname}_${pkgver}_jar.zip"
        "$pkgname.desktop"
        "$pkgname"
        "$pkgname.png")
sha256sums=('d3f85a313b2f47e0840047f0b7e695c1257c3ab7058c8460d9b321aa62a27812'
            '2efcff7fa1e6a83877e139055862cf2ed65e807367f1132c471262a2fc52e507'
            'eea674622c5939a5618f17e72ba5dba0a56b0b29f16b5fc832a761fe0bab9d33'
            'c1dde0995fff5e73e892ba340eed6c1e6cd680558b785c821e8b343b3afde264')

package() {
  cd "$srcdir/"

  #Files
  install -D -m644 "VOSviewer.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  
  for file in $(find "$srcdir/data/" -type f -name "*.*"); do
    install -D -m644 ${file} "$pkgdir/usr/share/java/$pkgname/data"
  done
  
  install -D -m644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D -m644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

}
