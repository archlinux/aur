# Maintainer: Andy Botting <andy@andybotting.com>
_ver=028c09c205c7eaee581f97290156b5b78c77ced5  # v1.3.8 but not tagged
pkgname=python-freshdesk
pkgver=1.3.8
pkgrel=1
pkgdesc='A Python client for the Freshdesk helpdesk API'
arch=('any')
url='https://github.com/sjkingo/python-freshdesk'
license=('BSD')
depends=('python-requests' 'python-dateutil')
checkdepends=('python-nose' 'python-responses' 'python-pytest'
              'python-mock')
#source=("https://github.com/sjkingo/$pkgname/archive/v$pkgver.tar.gz")
source=("https://github.com/sjkingo/python-freshdesk/archive/$_ver.zip")
sha512sums=('36b754e3bff6bf0752318272fd5cba09449568db7b4364b111252c5b3694809728359b8bc61ed622bb284b669213032fdd6b9965c72562f56a1e3eeb8f5a3052')

build() {
  cd $pkgname-$_ver
  python setup.py build
}

check() {
  cd $pkgname-$_ver
  pytest -v
}

package() {
  cd $pkgname-$_ver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
