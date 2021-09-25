# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Tim Schumacher <timschumi@gmx.de>

pkgname=python-ytmusicapi
pkgver=0.19.3
pkgrel=1
pkgdesc="Unofficial API for YouTube Music"
arch=('any')
url="https://github.com/sigma67/ytmusicapi"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('dfd0271f7177173cea9c255730151a10a2fe4a32f9accd2fe31e7645936c90c5')

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

