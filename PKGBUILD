# Maintainer: A Frederick Christensen <aur@ivories.org>

pkgname='python-wayremap'
_module='wayremap'
pkgver='0.0.10'
pkgrel=1
pkgdesc="A dynamic keyboard remapper for Wayland."
url="https://github.com/acro5piano/wayremap"
depends=('python' 'python' 'python-uinput' 'python-evdev' 'python-i3ipc')
makedepends=('python-setuptools' 'ipython' 'pyright' 'python-poetry')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('775c55e42359dd24b13859d0c553e030aba9c11d13fba4550aef09fbba955d6f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-wayremap/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
