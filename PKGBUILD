# Maintainer: Julian Brost <julian@0x4a42.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Rubin Simons <rubin@xs4all.nl>

pkgname=trac
pkgver=1.6
pkgrel=1
pkgdesc='Enhanced wiki and issue tracking system for software development projects'
arch=('any')
url="http://trac.edgewall.org/"
license=('BSD')
depends=(python python-jinja python-setuptools)
makedepends=(python-babel)
optdepends=('python-psycopg2: PostgreSQL database support'
            'python-pygments: Syntax highlighting'
            'python-docutils: reStructuredText support'
            'python-babel: localization support'
            'python-pytz: complete list of time zones')
source=(https://download.edgewall.org/trac/Trac-$pkgver.tar.gz)
sha256sums=('61d73c61f670d68ffc346829d24b2f1d2050aa561aa71cb98e2fb43992c27304')

package() {
  cd "$srcdir"/Trac-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir"
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/trac/COPYING
}
