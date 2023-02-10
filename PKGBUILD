# Maintainer: bunburya
pkgname=bother
pkgver=1.1
pkgrel=1
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
source=('https://files.pythonhosted.org/packages/de/5d/8a55f9a56d1e154e909cc9b82b92901267bf96d69e13d5efee1b2769ac4f/Bother-1.1.tar.gz')
md5sums=('36df9495b15d4c52d241820fa0a1f9a1')

build() {
    cd $srcdir/Bother-1.1
    python setup.py build
}

package() {
    cd $srcdir/Bother-1.1
    python setup.py install --root="$pkgdir" --optimize=1 
}
