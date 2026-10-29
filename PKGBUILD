# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: xduugu

pkgname="ofxstatement"
pkgver=0.9.3
pkgrel=3
pkgdesc="Tool to convert proprietary bank statement to OFX format, suitable for importing to GnuCash"
arch=("any")
url="https://github.com/kedder/ofxstatement"
license=("GPL")
depends=("python" "python-appdirs"
         "python-importlib-metadata"
         "python-setuptools")
makedepends=("python-build" "python-setuptools" "python-wheel" "python-installer")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('c070f657f1ee256e5ad4e789623c5fb93eb2fc94f2d6c9a4ff88116f9490bd07b6c55dbc8447f1df0a959cd628ccf4a047ae195fc2a70ca56ec4ab8d13bd13aa')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
