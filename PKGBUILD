# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# AUR Maintainer: GI Jack <GI_Jack@hackermail.com>

_pypiname=pdfrw
pkgname=python2-pdfrw
pkgver=0.4
pkgrel=3
pkgdesc='Convert restructured text to PDF via reportlab.'
arch=('any')
url="https://github.com/pmaupin/$_pypiname"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$_pypiname-$pkgver.tar.gz::https://github.com/pmaupin/$_pypiname/archive/v$pkgver.tar.gz")
md5sums=('8dc599a0c808a15f1499c0116ee3c92d')

prepare(){
  cp -r "$srcdir/$_pypiname-$pkgver" "$srcdir/$_pypiname-$pkgver-py2"
}

package() {
  depends=('python2')
  cd "$srcdir/$_pypiname-$pkgver-py2"
  python2 setup.py install --root="$pkgdir" -O1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

