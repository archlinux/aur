pkgname=hdl-make
pkgver=3.0.r537.gf3c20ff
pkgrel=1
pkgdesc="Hdlmake is a tool for generating multi-purpose makefiles for FPGA projects."
arch=('x86_64')
url="https://www.ohwr.org/project/hdl-make/wiki"
license=('GPL3')
depends=('python-setuptools')
provides=(hdlmake)
source=("git+https://ohwr.org/project/hdl-make.git#branch=develop")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir"/${pkgname}
    python setup.py install --root="$pkgdir"
}
