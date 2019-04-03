# Maintainer: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Oliver Mangold omangold at gmail dot com

_name=uncompyle6
pkgbase="python-${_name}"
pkgname=("python-${_name}" "python2-${_name}")
pkgver=3.2.6
pkgrel=1
pkgdesc="Python byte-code disassembler and source-code converter."
arch=('any')
url="https://github.com/rocky/python-uncompyle6/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3a40f4f4b8b02a8687bd98c598980bed38a4770e3de253847eafed4b7167d07f')

package_python-uncompyle6() {
    depends=('python-spark-parser>=1.8.7' 'python-spark-parser<1.9.0' 'python-xdis>=3.9.0' 'python-xdis<3.10.0')

    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-uncompyle6() {
    depends=('python2-spark-parser>=1.8.7' 'python2-spark-parser<1.9.0' 'python2-xdis>=3.9.0' 'python2-xdis<3.10.0')

    cd "$srcdir/$_name-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
    mv "$pkgdir/usr/bin/uncompyle6" "$pkgdir/usr/bin/uncompyle62"
    mv "$pkgdir/usr/bin/pydisassemble" "$pkgdir/usr/bin/pydisassemble2"
}
