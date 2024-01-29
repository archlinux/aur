# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: xduugu

pkgname="ofxstatement"
pkgver=0.9.0
pkgrel=1
pkgdesc="Tool to convert proprietary bank statement to OFX format, suitable for importing to GnuCash"
arch=("any")
url="https://github.com/kedder/ofxstatement"
license=("GPL")
depends=("python-appdirs"
         "python-importlib-metadata")
makedepends=("python-build" "python-packaging" "python-wheel" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/kedder/ofxstatement/archive/$pkgver.tar.gz")
b2sums=('bbe8a6852066e3c2a7d29a4b5ef39fbedba25da4fac6a6babcf4535bc709d6d385811156602babc7f799bbdea6bf134b98cd6f22147c408b1cf99dc12afd1be4')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
