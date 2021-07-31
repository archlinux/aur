# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-mpris_server
_name=${pkgname#python-}
pkgver=0.4.2
pkgrel=2
pkgdesc="Integrate MPRIS Media Player support into your app"
arch=('any')
url="https://github.com/alexdelorenzo/mpris_server"
license=('AGPL3')
depends=('python-gobject' 'python-pydbus' 'python-unidecode' 'python-emoji'
         'python-typing_extensions')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a779ccf347ce32d46678abce5ee5f8d05bbdc47f203e06329de5db512ebbf1f1')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
