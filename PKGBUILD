# Maintainer: csantosb <csantosb dot inventati dot org>
pkgname=python-fusesoc
pkgver=1.9
pkgrel=0
pkgdesc="Coroutine based cosimulation library for writing VHDL and Verilog testbenches in Python"
arch=('any')
url="http://github.com/olofk/fusesoc/"
license=('GPLv3')
conflicts=('python-fusesoc-git')
provides=('python-fusesoc')
depends=('python' 'python-edalize')

makedepends=('python-setuptools')
optdepends=('iverilog: for simulating verilog designs'
            'ghdl: for simulating VHDL designs')

options=(!emptydirs)
source=("https://github.com/olofk/fusesoc/releases/download/$pkgver/fusesoc-$pkgver.tar.gz")
md5sums=('eec2d6fd3c8c68ce00b2eae7edb8e1a7')

package() {
    cd "${srcdir}/fusesoc-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
