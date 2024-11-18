# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: xduugu

pkgname="ofxstatement"
pkgver=0.9.1
pkgrel=2
pkgdesc="Tool to convert proprietary bank statement to OFX format, suitable for importing to GnuCash"
arch=("any")
url="https://github.com/kedder/ofxstatement"
license=("GPL")
depends=("python-appdirs"
         "python-importlib-metadata"
         "python-setuptools")
makedepends=("python-build" "python-packaging" "python-wheel" "python-installer")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('d7ee1e25c7950e4b98139da70550ac4f7efe730c740410b3ca56cda95a5dbd0ed49588e778fa382808bcc8787874d49daed7f99af0e271cd5f71c30a383573bf')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
