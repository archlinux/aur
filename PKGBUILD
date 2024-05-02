# Maintainer: Simon Zack <simonzack@gmail.com>
# Contributor: David Albuquerque <david.alb2011@gmail.com>
# Contributer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributer: Ekin Dursun <ekindursun@gmail.com>
# Contributer: Oliver Mangold omangold at gmail dot com

pkgname=python-xdis
_name=${pkgname#python-}
pkgver=6.1.0
pkgrel=2
pkgdesc='Python cross-version bytecode library and disassembler'
arch=('any')
url='https://github.com/rocky/python-xdis'
license=('GPL2')
depends=('python-click'
        'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('355fd36db210e9117167e0821e2bcc12ac3da8bcc15d52e1542ad422ad2629cc')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
