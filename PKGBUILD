# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: xduugu

pkgname="ofxstatement"
pkgver=0.9.2
pkgrel=1
pkgdesc="Tool to convert proprietary bank statement to OFX format, suitable for importing to GnuCash"
arch=("any")
url="https://github.com/kedder/ofxstatement"
license=("GPL")
depends=("python-appdirs"
         "python-importlib-metadata"
         "python-setuptools")
makedepends=("python-build" "python-packaging" "python-wheel" "python-installer")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('88b794d6fe50db672ec697294f043a2ab80ac3ee6057bbc7d72f9e718b7293f45cb233d9910bb44799dcf3b9d49685cb13a5d92d2d36521a5de1041b2f0793c9')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
