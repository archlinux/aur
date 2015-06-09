# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-verlib
pkgver=0.1
pkgrel=2
pkgdesc="A new version comparison tool for distutils"
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('python2-setuptools')
url="https://pypi.python.org/pypi/verlib"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/v/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('1cdf84a3e5334558e428b4067f586e7b')
sha256sums=('652d097d114dc9076606a5416b0dc193df3ef2632596e6e0e9d21d2ba51bf267')

build() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
