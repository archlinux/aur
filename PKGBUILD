# Maintainer: 
pkgname=pybookreader
_pkgname=PyBookReader
pkgver=0.5.0
pkgrel=1
pkgdesc="PyBookReader+OrnamentBook"
arch=('any')
url="http://pybookreader.narod.ru"
license=('custom')
depends=('python>=2.0' 'gtk2>=2.0' 'pygtk>=2.0' 'libxml2>=2.0')
source=("http://pybookreader.narod.ru/${_pkgname}-$pkgver.tar.gz" 'Pybr.desktop' 'pybr.png' 'Ob.desktop' 'ob.png')
md5sums=('9c36e3c8f3910884655bb9f87ae45374'
         '3b12bfb1ccd5dbfd577094a35d8c17c8'
         'dcb45e395351c496598220b4d51b4dd5'
         'bb8a2f520dce887036cec899cea44469'
         '80a7d5905556dd5d4add29b9a0e7a18c')
build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py build
}
package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 ../../pybr.png "$pkgdir/usr/share/pixmaps/pybr.png"
    install -Dm644 ../../ob.png "$pkgdir/usr/share/pixmaps/ob.png"
    install -Dm644 ../../Pybr.desktop "$pkgdir/usr/share/applications/Pybr.desktop"
    install -Dm644 ../../Ob.desktop "$pkgdir/usr/share/applications/Ob.desktop"
}