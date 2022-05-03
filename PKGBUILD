# Maintainer: bitwave <aur [aTTt] oomlu [d.0t] de>
pkgbase='python-task2dot'
pkgname=('python-task2dot')
_module='task2dot'
pkgver='0.0.15'
pkgrel=1
pkgdesc="Convert taskwarrior export to graphviz format and analyse projects"
url="https://github.com/garykl/task2dot"
depends=('python')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('81ba3f67d16435e4f4b45e286dc429a19db8afd999bb99095e02d1c0877effc9')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
