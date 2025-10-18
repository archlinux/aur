# Maintainer: Simon Zack <simonzack@gmail.com>
# Contributor: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Ting-Wei Lan <lantw44@gmail.com>
# Contributor: Oliver Mangold <omangold@gmail.com>

pkgname=python-uncompyle6
_name=${pkgname#python-}
pkgver=3.9.3
pkgrel=1
pkgdesc="Python byte-code disassembler and source-code converter."
arch=('any')
url="https://github.com/rocky/python-uncompyle6/"
license=('MIT')
depends=('python-click'
         'python-spark-parser>=1.8.9'
         'python-spark-parser<1.9.2'
         'python-xdis>=6.1.0'
         'python-xdis<6.3')
makedepends=('python-build'
             'python-installer'
             'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('78b764d4c843b0455fb39db6deb421a48d5d3ebb846537ba6444afe107c4ebc1')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
