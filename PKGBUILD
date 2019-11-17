# Maintainer: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Oliver Mangold omangold at gmail dot com

_name=uncompyle6
pkgbase="python-${_name}"
pkgname=("python-${_name}" "python2-${_name}")
pkgver=3.5.0
pkgrel=1
pkgdesc="Python byte-code disassembler and source-code converter."
arch=('any')
url="https://github.com/rocky/python-uncompyle6/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('4e6e86c05de588cbf5a2c35ddd080f23cd1770a1ad15c84dc1b2c78d65113af7')

package_python-uncompyle6() {
    depends=('python-spark-parser>=1.8.9' 'python-spark-parser<1.9.0' 'python-xdis>=4.1.2' 'python-xdis<4.2.0')

    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-uncompyle6() {
    depends=('python2-spark-parser>=1.8.9' 'python2-spark-parser<1.9.0' 'python2-xdis>=4.1.2' 'python2-xdis<4.2.0')

    cd "$srcdir/$_name-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
    mv "$pkgdir/usr/bin/uncompyle6" "$pkgdir/usr/bin/uncompyle62"
    mv "$pkgdir/usr/bin/pydisassemble" "$pkgdir/usr/bin/pydisassemble2"
}
