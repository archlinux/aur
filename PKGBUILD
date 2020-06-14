# Maintainer: Adrian Petrescu <adrian@apetre.sc>

pkgname=gmailieer
_pkgname=lieer
pkgver=1.2
pkgrel=1
pkgdesc='Fast fetch and two-way tag synchronization between notmuch and GMail'
arch=('any')
url=https://github.com/gauteh/${_pkgname}
license=('GPL3')
depends=('python-oauth2client' 'python-google-api-python-client' 'python-tqdm')
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver/${_pkgname}-v$pkgver.tar.gz")
sha512sums=('04465b40d18ee5e8a09d09c3b174b7a7342544f74adea5a3254e2d48904bb40b094709197b96f02541bae9d876f8896d415d2525fe97e66e5e6dbb36049d7f3b')

build() {
  cd ${_pkgname}-$pkgver
  python setup.py build
}

package() {
  cd ${_pkgname}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
