# Maintainer: Brokenpip3 <brokenpip3[at]gmail[dot]com>
# Contributor: Jens John <dev@2ion.de>

pkgname=python-pylxd
pkgver=2.2.9
pkgrel=1
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
sha512sums=('b8c44a830aab3a01a52b2db12cea66a4f5962489cc2075f0eb925b67cb1c92286b52c40d035b8cb5c74f7f3e13fa2dbe74bc6a462880d881900748ae867e093d')

build() {
  cd "$srcdir/pylxd-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/pylxd-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1
}
