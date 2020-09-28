# Maintainer: Giuseppe Nebbione <giuseppenebbione at gmail dot com>
# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=python-kb
_module=kb-manager
pkgver=0.1.3
pkgrel=2
pkgdesc="A command line minimalist knowledge base manager"
url="https://github.com/gnebbia/kb"
depends=('python-attrs' 'python-colored' 'python-setuptools' 'python-toml')
checkdepends=('python-pytest-cov')
provides=('kb')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('78e14f6eef30a4742925cc75ba9a5509c032ae42e73e26582cd7ed91794f41df')

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
