# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-vcstool'
pkgname=('python-vcstool')
_module='vcstool'
pkgver='0.2.8'
pkgrel=1
pkgdesc="vcstool provides a command line tool to invoke vcs commands on multiple repositories."
url="https://github.com/dirk-thomas/vcstool"
depends=('python' 'python-yaml')
conflicts=('python2-vcstool')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('9a6cd371a0ebd3ea3928a2171f150683a7195cd21e5f4d855ef4bff156fe8c0f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
