# Maintainer: Adrian Petrescu <adrian@apetre.sc>

pkgname=gmailieer
_pkgname=lieer
pkgver=0.11
pkgrel=1
pkgdesc='Fast fetch and two-way tag synchronization between notmuch and GMail'
arch=('any')
url=https://github.com/gauteh/${_pkgname}
license=('GPL3')
depends=('python-oauth2client' 'python-google-api-python-client' 'python-tqdm')
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver/${_pkgname}-v$pkgver.tar.gz")
sha512sums=('b07d2a92d966d860af03db6f1faded478660e1550f5c2b1b33a63363a3dfb5a25d29e0ca5cb730caad78ce34dc76bdb1b98d1446d5857fd2a8549e2f26dbc99e')

build() {
  cd ${_pkgname}-$pkgver
  python setup.py build
}

package() {
  cd ${_pkgname}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
