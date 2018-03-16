# Maintainer: James An <james@jamesan.ca>

pkgname=python2-tinydav
_pkgname=${pkgname#python2-}
pkgver=0.7.5
pkgrel=1
pkgdesc='An easy-to-use HTTP and WebDAV client library..'
arch=('any')
url="https://gitlab.helduel.de/open-source/$_pkgname"
license=('LGPL3')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-coverage')

source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('33024f7c66b536ff5b45a42f57da405c')

build() {
  cd "$_pkgname-$pkgver"

  python2 setup.py build
}

#~ check() {
  #~ cd "$_pkgname-$pkgver"
  
  #~ python2 test/testloader.py
#~ }

package() {
  cd "$_pkgname-$pkgver"
  
  python2 setup.py install --root="$pkgdir" --optimize=1
}
