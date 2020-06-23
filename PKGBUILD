# Maintainer: Matthew Murray <matt@compti.me>
pkgname=python-gphotos-sync
_pkgname=gphotos-sync
pkgver=2.14.2
pkgrel=1
pkgdesc="Google Photos and Albums backup with Google Photos Library API"
arch=('any')
license=('MIT')
depends=("python" "python-attrs" "python-exif" "python-appdirs" "python-requests-oauthlib" "python-pyaml" "python-psutil")
makedepends=("python" "python-setuptools")
url="https://github.com/gilesknap/${_pkgname}"
source=("${url}/archive/$pkgver.tar.gz")
md5sums=('88fd01f0852c3410106ca75c4d4c92e8')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root "${pkgdir}" || return 1

  # TODO Include service file
}

# vim:set ts=2 sw=2 et:
