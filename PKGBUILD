# Maintainer: bunburya
pkgname=bother
pkgver=1.0
pkgrel=2
pkgdesc="Produce heightmaps using real-world elevation data (primarily for use in OpenTTD)."
url="https://github.com/bunburya/bother"
depends=('python'
         'python-numpy'
         'python-rasterio'
         'python-pillow'
         'python-appdirs'
         'python-requests'
         'python-tqdm')
makedepends=('python-setuptools')

license=('MIT')
arch=('any')
source=('https://files.pythonhosted.org/packages/86/f8/e7e063e27ebda8293a70e3158d2e3f962221de9598da4487fa9bc03830ed/Bother-1.0.tar.gz')
md5sums=('f739ca9db03ac29fbd74abb15c1ec9e9')

build() {
    cd $srcdir/Bother-1.0
    python setup.py build
}

package() {
    cd $srcdir/Bother-1.0
    python setup.py install --root="$pkgdir" --optimize=1 
}
