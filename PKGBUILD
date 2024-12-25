# Maintainer: somini <dev@somini.xyz>

pkgbase=python-pythumbnailer
pkgname=python-pythumbnailer
_module='pythumbnailer'
pkgver=0.9.1
pkgrel=5
pkgdesc="Create static HTML galleries with thumbnails"
url="https://gitlab.com/somini/pythumbnailer/"
depends=('python' 'python-jinja' 'python-pillow' 'python-argparse-utils' 'ffmpeg')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('0793b4c4045bd31ac0f3cff3a429a0ffd89bd6cc40f23ff83adbbd2d25f661fa')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
