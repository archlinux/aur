# Maintainer: somini <dev@somini.xyz>

pkgbase=python-pythumbnailer
pkgname=python-pythumbnailer
_module='pythumbnailer'
pkgver=0.6.1
pkgrel=1
pkgdesc="Create static HTML galleries with thumbnails"
url="https://gitlab.com/somini/pythumbnailer/"
depends=('python' 'python-argparse-utils' 'ffmpeg')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('fec9be889fec77f1abb5c38e466f632dc20fb8914b7cd5f29cbb57d5765fbde6')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
