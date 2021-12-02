# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Tim Schumacher <timschumi@gmx.de>

pkgname=python-ytmusicapi
pkgver=0.19.5
pkgrel=1
pkgdesc="Unofficial API for YouTube Music"
arch=('any')
url="https://github.com/sigma67/ytmusicapi"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('85a65ee5a7f0914f300fcb3696b98726e568e933b709c43fd13b896c73e6aaf5')

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

