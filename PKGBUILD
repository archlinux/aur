# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-coinkit
pkgver=0.7.8
pkgrel=1
pkgdesc="Keypair, address, brain wallet & deterministic wallet creation for Bitcoin, Litecoin, Dogecoin, Namecoin and others"
arch=('any')
depends=('python2' 'python2-characters' 'python2-ecdsa' 'python2-pybitcointools' 'python2-utilitybelt')
makedepends=('python2-setuptools')
url="https://github.com/onenameio/coinkit"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('739b7787ddd629b766bf04af86a196f9')
sha256sums=('2588ec4516c649e4f8469dcd79ed1a6345dc0f71b4003ef88276f7c31fd1f587')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
