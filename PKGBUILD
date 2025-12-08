# Maintainer: Keon Cachia <keonfarrugia@gmail.com>
# Contributer: Adrian Petrescu <adrian@apetre.sc>
pkgname=lieer
pkgver=1.6
pkgrel=1
pkgdesc='Fast fetch and two-way tag synchronization between notmuch and GMail'
arch=('any')
url=https://github.com/gauteh/${pkgname}
license=('GPL3')
depends=('python-google-auth-oauthlib' 'python-oauthlib' 'python-google-api-python-client' 'notmuch' 'python')
optdepends=('python-tqdm: Progress bar')
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver/${pkgname}-v$pkgver.tar.gz")
sha512sums=('ba5fa49666c3281c165947e7aaedb3f568d1d30be12aeaf8361d632f5d11911e6fcd975d6e95f20724ce50e85e198f884516699b55e08185026679523d000bf3')replaces=('gmailieer')

build() {
  cd ${pkgname}-$pkgver
  python setup.py build
}

package() {
  cd ${pkgname}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
