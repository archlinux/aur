# Maintainer: Giuseppe Nebbione <giuseppenebbione at gmail dot com>
# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=python-kb
_module=kb-manager
pkgver=0.1.5
pkgrel=1
pkgdesc="A command line minimalist knowledge base manager"
url="https://github.com/gnebbia/kb"
depends=('python-attrs' 'python-colored' 'python-setuptools' 'python-toml')
checkdepends=('python-pytest-cov')
provides=('kb')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('84314d3683732124f6bb9bb1bc82e3972ef808b4d256a7da34ac00ce29259eab')

build() {
    cd ${_module}-${pkgver}
    python setup.py build
}

check() {
    cd ${_module}-${pkgver}
    pytest -v
}

package() {
    cd ${_module}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
