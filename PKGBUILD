# Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgbase='python-nbtermix'
pkgname=('python-nbtermix')
_module='nbtermix'
pkgver='0.1.2'
pkgrel=1
pkgdesc="Fork of nbterm. Jupyter Notebooks in Your terminal."
url="https://github.com/mtatton/nbterm"
depends=('python' 'python-rich')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('5c0568311cecf0992e0c2f80fea028c969bf877181481fa040bea442449d13c2')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-nbtermix/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
