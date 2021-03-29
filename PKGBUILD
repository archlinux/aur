# Maintainer: Giuseppe Nebbione <giuseppenebbione at gmail dot com>
# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=kb
_module=kb-manager
pkgver=0.1.6
pkgrel=2
pkgdesc="A command line minimalist knowledge base manager"
arch=('any')
url="https://github.com/gnebbia/kb"
license=('GPL3')
depends=('python-attrs' 'python-colored' 'python-gitpython' 'python-setuptools' 'python-toml')
checkdepends=('python-pytest-cov')
conflicts=("python-kb")
replaces=("python-kb")
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('55e3d8fd160ce1c71e3acaaf1bc14603fcb5dd055fc7eb62521d3f3737749b1d')

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
