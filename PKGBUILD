# Maintainer: Simon Zack <simonzack@gmail.com>
# Contributor: David Albuquerque <david.alb2011@gmail.com>
# Contributer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributer: Ekin Dursun <ekindursun@gmail.com>
# Contributer: Oliver Mangold omangold at gmail dot com

pkgname=python-xdis
_name=${pkgname#python-}
pkgver=6.1.8
pkgrel=1
pkgdesc='Python cross-version bytecode library and disassembler'
arch=('any')
url='https://github.com/rocky/python-xdis'
license=('GPL2')
depends=('python-click'
         'python-six')
makedepends=('python-build'
             'python-installer'
             'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a070c390f814395d672a8732b8b5e8e09cdeeaac1b32497e8061c24f126f6d69')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
