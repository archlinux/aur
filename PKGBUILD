# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Tim Schumacher <timschumi@gmx.de>

pkgname=python-ytmusicapi
pkgver=0.19.1
pkgrel=1
pkgdesc="Unofficial API for YouTube Music"
arch=('any')
url="https://github.com/sigma67/ytmusicapi"
license=('MIT')
depends=('python-setuptools' 'python-requests')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1b8a050e2208b3d05359106d8c44c3d62e60edf6753529bd8a207788a6caeb95')

build() {
  cd ytmusicapi-$pkgver
  python setup.py build
}

package() {
  cd ytmusicapi-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dvm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

