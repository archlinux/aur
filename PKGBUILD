# Maintainer: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-pyminifier
pkgver=2.1
pkgrel=3
pkgdesc="Pyminifier is a Python code minifier, obfuscator, and compressor."
url="https://github.com/liftoff/pyminifier"
depends=('python' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/2c/8a/946b0b43e0912c907aba42507073675c2e4a4a836c5b1ce10be6f12575d0/pyminifier-2.1.tar.gz")
sha256sums=('e192618fe901830e9298825b32828bc9555ae8649e05af37bfab2db328546777')

build() {
    cd $srcdir/pyminifier-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/pyminifier-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
