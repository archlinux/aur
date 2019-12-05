# Maintainer: Adrian Petrescu <adrian@apetre.sc>

pkgname=gmailieer
_pkgname=lieer
pkgver=1.0
pkgrel=1
pkgdesc='Fast fetch and two-way tag synchronization between notmuch and GMail'
arch=('any')
url=https://github.com/gauteh/${_pkgname}
license=('GPL3')
depends=('python-oauth2client' 'python-google-api-python-client' 'python-tqdm')
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver/${_pkgname}-v$pkgver.tar.gz")
sha512sums=('21c93baffa36ac4ce88654e5b65b57af97f612233cb0857d2d0a17e12b31bd72d082e5a5d3ab343aa852158bdcc10f61508c90ecccec5588b4cb745a588b9e76')

build() {
  cd ${_pkgname}-$pkgver
  python setup.py build
}

package() {
  cd ${_pkgname}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
