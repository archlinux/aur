# Maintainer: Giuseppe Nebbione <giuseppenebbione at gmail dot com>
# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=python-kb
_module=kb-manager
pkgver=0.1.4
pkgrel=1
pkgdesc="A command line minimalist knowledge base manager"
url="https://github.com/gnebbia/kb"
depends=('python-attrs' 'python-colored' 'python-setuptools' 'python-toml')
checkdepends=('python-pytest-cov')
provides=('kb')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('33581d4e4977ce3504d24b0c16ee6460557c68925acfcb1c81208c931dbfbf45')

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
