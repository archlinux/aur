# Maintainer: csantosb <csantosb dot inventati dot org>
pkgname=python-vsg
pkgver=1
pkgrel=11.1
pkgdesc="Coding style enforcement for VHDL"
arch=('any')
url="https://github.com/jeremiah-c-leary/vhdl-style-guide/"
license=('GPLv3')
conflicts=('python-vsg-git')
provides=('python-vsg')
depends=('python' 'python-setuptools' 'python-pyyaml')

makedepends=('git')

options=(!emptydirs)
source=("git+https://github.com/jeremiah-c-leary/vhdl-style-guide#tag=${pkgver}.${pkgrel}")
md5sums=('SKIP')

build() {
    cd "${srcdir}/vhdl-style-guide"
    python setup.py build
}

package() {
    cd "${srcdir}/vhdl-style-guide"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
