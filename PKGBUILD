# Maintainer: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Oliver Mangold omangold at gmail dot com

_name=uncompyle6
pkgbase="python-${_name}"
pkgname=("python-${_name}" "python2-${_name}")
pkgver=3.2.3
pkgrel=1
pkgdesc="Python byte-code disassembler and source-code converter."
arch=('any')
url="https://github.com/rocky/python-uncompyle6/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('bd882f3c979b49d28ba7accc5ce7380ced8cab12e782e9170769ca15f0b81f8a')

package_python-uncompyle6() {
    depends=('python-spark-parser>=1.8.5' 'python-spark-parser<1.9.0' 'python-xdis>=3.8.4' 'python-xdis<3.9.0')

    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-uncompyle6() {
    depends=('python2-spark-parser>=1.8.5' 'python2-spark-parser<1.9.0' 'python2-xdis>=3.8.4' 'python2-xdis<3.9.0')

    cd "$srcdir/$_name-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
    mv "$pkgdir/usr/bin/uncompyle6" "$pkgdir/usr/bin/uncompyle62"
    mv "$pkgdir/usr/bin/pydisassemble" "$pkgdir/usr/bin/pydisassemble2"
}
