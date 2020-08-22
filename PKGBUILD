# Maintainer: somini <dev@somini.xyz>

pkgbase=python-pythumbnailer
pkgname=python-pythumbnailer
_module='pythumbnailer'
pkgver=0.3
pkgrel=2
pkgdesc="Create static HTML galleries with thumbnails"
url="https://gitlab.com/somini/pythumbnailer/"
depends=('python' 'python-argparse-utils' 'ffmpeg')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('a6bf3bea6ae2fe31391c7016b417144633a68e5cb08ccd0eda23779b55944927')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
