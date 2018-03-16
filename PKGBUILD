# Maintainer: James An <james@jamesan.ca>

pkgname=python2-gsutil
_pkgname=${pkgname#python2-}
pkgver=4.29
pkgrel=1
pkgdesc='A command line tool for interacting with cloud storage services.'
arch=('any')
url="https://cloud.google.com/storage/docs/$_pkgname"
license=('Apache')
depends=('python2')
makedepends=('python2-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('6f798dc01cd5c058f20dfa1cb1aaa81c')

build() {
  cd "$_pkgname-$pkgver"

  python2 setup.py build
}

check() {
  cd "$_pkgname-$pkgver"
  
  python2 setup.py test
}

package() {
  cd "$_pkgname-$pkgver"
  
  python2 setup.py install --root="$pkgdir" --optimize=1
}
