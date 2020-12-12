# Maintainer: somini <dev@somini.xyz>

pkgbase=python-pythumbnailer
pkgname=python-pythumbnailer
_module='pythumbnailer'
pkgver=0.4.2
pkgrel=2
pkgdesc="Create static HTML galleries with thumbnails"
url="https://gitlab.com/somini/pythumbnailer/"
depends=('python' 'python-argparse-utils' 'ffmpeg')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('32be5940486f799e610d3410c2b0ae1c1e3ff92bb2ffc2708bacc98c415ac68e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
