# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-gittle
pkgver=0.5.0
pkgrel=1
pkgdesc="A high level pure python git implementation"
arch=('any')
depends=('python2' 'python2-crypto' 'python2-dulwich' 'python2-funky' 'python2-paramiko')
makedepends=('python2-setuptools')
url="https://github.com/FriendCode/gittle"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/g/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('35c4d3f608c81b6f7cc91b8bfc1221ff')
sha256sums=('b1e53b324e053183413eb2f0f21697d234c83b9b1de12f1e245f5dd0f30ba1d8')
provides=('gittle' 'python2-gittle')
conflicts=('gittle')

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
