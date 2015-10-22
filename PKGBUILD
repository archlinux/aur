# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Arthur Darcet <arthur.darcet@m4x.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: miles g <miles@milesgroman.com>
# Contributor: Pierre Bourdon <delroth@gmail.com>
pkgname=python-lockfile
pkgver=0.11.0
pkgrel=1
pkgdesc='Platform-independent file locking module'
license=('MIT')
url="https://pypi.python.org/pypi/lockfile"
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/l/lockfile/lockfile-${pkgver}.tar.gz")
arch=('any')
options=(!emptydirs)
md5sums=('494b449935f95f0f62e621b5f52640f8')
sha256sums=('eed7e0c829135aaaf2a9df83652bc6e2cc50175d933741c25aac0394674e7fd3')

prepare() {
  cd "${srcdir}/lockfile-${pkgver}"
  2to3 --no-diffs -w lockfile/*.py
}

package() {
  cd "${srcdir}/lockfile-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
