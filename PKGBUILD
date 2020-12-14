# Maintainer: Adrian Petrescu <adrian@apetre.sc>

pkgname=gmailieer
_pkgname=lieer
pkgver=1.3
pkgrel=2
pkgdesc='Fast fetch and two-way tag synchronization between notmuch and GMail'
arch=('any')
url=https://github.com/gauteh/${_pkgname}
license=('GPL3')
depends=('python-oauth2client' 'python-google-api-python-client' 'python-tqdm')
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver/${_pkgname}-v$pkgver.tar.gz")
sha512sums=('afebbce453b895937118a3015786ad403356cb1b18dcde7f5f5cf76b89e61baa5a452b70d3518653cf3113de5a308b39a167d0f50bb517c9d1b3e3610824eb62')

build() {
  cd ${_pkgname}-$pkgver
  python setup.py build
}

package() {
  cd ${_pkgname}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
