# Maintainer: somini <dev@somini.xyz>

pkgbase=python-pythumbnailer
pkgname=python-pythumbnailer
_module='pythumbnailer'
pkgver=0.7
pkgrel=1
pkgdesc="Create static HTML galleries with thumbnails"
url="https://gitlab.com/somini/pythumbnailer/"
depends=('python' 'python-argparse-utils' 'ffmpeg')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('5f346bba23802cb2fe81a6bded450ca6c475ed2d06e68676737aba746de7cb91')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
