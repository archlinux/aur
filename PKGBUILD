pkgname=hdl-make
pkgver=3.0.r334.g44a5ece
pkgrel=1
pkgdesc="Hdlmake is a tool for generating multi-purpose makefiles for FPGA projects."
arch=('x86_64')
url="https://www.ohwr.org/project/hdl-make/wiki"
license=('GPL3')
depends=('python-setuptools')
provides=(hdlmake)
source=("https://ohwr.org/project/hdl-make.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir"/${pkgname}
    python setup.py install --root="$pkgdir"
}
