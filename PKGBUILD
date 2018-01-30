# Maintainer: robertfoster
# Submitter: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-miniupnpc
pkgver=2.0.20171212
pkgrel=1
pkgdesc="A small UPnP client library/tool to access Internet Gateway Devices (python2 module only)"
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('python2-setuptools')
url="http://miniupnp.free.fr"
license=('custom')
options=(!emptydirs)
source=("http://miniupnp.free.fr/files/${pkgname#python2-}-$pkgver.tar.gz")

build() {
  cd $srcdir/${pkgname#python2-}-$pkgver
  
  msg 'Building...'
  make
  python2 setup.py build

}

package() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}

md5sums=('9d4a454806a8d3d7ccf09858ab2df81c')
