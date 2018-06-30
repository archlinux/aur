pkgname=python-pylxd
pkgver=2.2.7
pkgrel=2
pkgdesc="Python module for LXD"
arch=(any)
url=https://github.com/lxc/pylxd
license=("APACHE")
depends=(
  'python'                     
  'python-pbr' 
  'python-six' 
  'python-ws4py' 
  'python-requests' 
  'python-requests-unixsocket' 
  'python-requests-toolbelt' 
  'python-cryptography' 
  'python-pyopenssl' 
)
optdepends=('lxd: Core LXD services')
source=("https://github.com/lxc/pylxd/archive/${pkgver}.tar.gz")
sha512sums=(SKIP)

build() {
  cd "$srcdir/pylxd-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/pylxd-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1
}
