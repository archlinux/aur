# Maintainer: csantosb <csantosb dot inventati dot org>
pkgname=python-fusesoc
pkgver=1.10
pkgrel=0
pkgdesc="Coroutine based cosimulation library for writing VHDL and Verilog testbenches in Python"
arch=('any')
url="http://github.com/olofk/fusesoc/"
license=('GPLv3')
conflicts=('python-fusesoc')
provides=('python-fusesoc')
depends=('python' 'python-edalize')

makedepends=('python-setuptools')
optdepends=('iverilog: for simulating verilog designs'
            'ghdl: for simulating VHDL designs')

options=(!emptydirs)
source=("git+https://github.com/olofk/fusesoc#tag=${pkgver}")
md5sums=('SKIP')

package() {
    cd "${srcdir}/fusesoc"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
