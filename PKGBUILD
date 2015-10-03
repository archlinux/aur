# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Arthur Darcet <arthur.darcet@m4x.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: miles g <miles@milesgroman.com>
# Contributor: Pierre Bourdon <delroth@gmail.com>
pkgname=python-lockfile
pkgver=0.10.2
pkgrel=2
pkgdesc='Platform-independent file locking module'
license=('MIT')
url="https://pypi.python.org/pypi/lockfile"
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/l/lockfile/lockfile-${pkgver}.tar.gz")
arch=('any')
options=(!emptydirs)
md5sums=('1aa6175a6d57f082cd12e7ac6102ab15')
sha256sums=('9e42252f17d1dd89ee31745e0c4fbe58862c25147eb0ef5295c9cd9bcb4ea2c1')

prepare() {
  cd "${srcdir}/lockfile-${pkgver}"
  2to3 -w lockfile/*.py
}

package() {
  cd "${srcdir}/lockfile-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

