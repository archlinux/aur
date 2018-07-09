# Maintainer: FFY00 <filipe.lains@gmail.com>
# Contributor: Troels Jacobsen <tkjacobsen@gmail.com>
pkgname=evernote-sdk-python
pkgver=1.28
pkgrel=4
pkgdesc='Evernote SDK for Python'
arch=(any)
url="https://github.com/evernote/$pkgname"
license=('Custom')
depends=('python2-oauth2')
makedepends=('python2-setuptools')
provides=("$pkgname")
conflicts=("$pkgname")
source=(
  "$url/archive/$pkgver.tar.gz"
  'evernote-sdk-python-1.28-fix-setup.patch'
)
md5sums=(
  'b71aaeb73fcb89626401bf5e3755ae87'
  '088af5b39f219ada3847ba03e24614ab'
)

build () {
  cd $pkgname-$pkgver
  patch -p0 < ../$pkgname-$pkgver-fix-setup.patch
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir"
}
