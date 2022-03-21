# Maintainer: dobedobedo <dobe0331 at gmail dot com>
_pkgname='pyshader'
pkgname=("python-$_pkgname")
pkgver=0.7.0
pkgrel=1
pkgdesc="Write modern GPU shaders in Python"
arch=('x86_64')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
url='https://kompute.cc/'
license=('BSD')
sha256sums=('5357c37cb6b9841037c187fa72be5b5e6e131383f6258c880def56f98471ba67')
_source_url="https://files.pythonhosted.org/packages/d6/49/6c6018841489815ca0ebd57a945edaecf92dd34d380f810740a4372fcdf6"
source=("$_source_url/$_pkgname-$pkgver.tar.gz")

build() {
    cd "$srcdir/$_pkgname-$pkgver/"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver/"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
} 
