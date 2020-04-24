# Maintainer: Adrian Petrescu <adrian@apetre.sc>

pkgname=gmailieer
_pkgname=lieer
pkgver=1.1
pkgrel=1
pkgdesc='Fast fetch and two-way tag synchronization between notmuch and GMail'
arch=('any')
url=https://github.com/gauteh/${_pkgname}
license=('GPL3')
depends=('python-oauth2client' 'python-google-api-python-client' 'python-tqdm')
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver/${_pkgname}-v$pkgver.tar.gz")
sha512sums=('3a066ffc4ed5b6dc07f3ebbf69ea9fef7c31640f8b07422f3f1f07018becc3623598fff215cf7e217aab65b4de8b40023e53cc0d79d5d1f6e9e802b4bfb8cb82')

build() {
  cd ${_pkgname}-$pkgver
  python setup.py build
}

package() {
  cd ${_pkgname}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
