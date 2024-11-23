# Maintainer: Simon Zack <simonzack@gmail.com>
# Contributor: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Ting-Wei Lan <lantw44@gmail.com>
# Contributor: Oliver Mangold <omangold@gmail.com>

pkgname=python-uncompyle6
_name=${pkgname#python-}
pkgver=3.9.2
pkgrel=1
pkgdesc="Python byte-code disassembler and source-code converter."
arch=('any')
url="https://github.com/rocky/python-uncompyle6/"
license=('MIT')
depends=('python-click'
         'python-spark-parser>=1.8.9'
         'python-spark-parser<1.9.2'
         'python-xdis>=6.1.0'
         'python-xdis<6.2.0')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6f70980ffe08a64b114b6871832fd02d86c99035f8976a8f1f8121dad6fca425')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
