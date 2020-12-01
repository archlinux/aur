# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Cedric Staub <cs+aur {at} cssx.cc>

pkgname=episoder
pkgver=0.9.1
pkgrel=1
pkgdesc='Tool to tell you about new episodes of your favourite TV shows'
arch=('any')
url=https://code.ott.net/episoder/
license=('GPL3')
depends=('python-argparse' 'python-beautifulsoup4' 'python-requests'
         'python-sqlalchemy')
makedepends=('python-setuptools')
source=("$url/downloads/$pkgname-$pkgver.tar.gz"{,.asc})
b2sums=('4b39ff2efd3f116feb2885c14975357cb8155ada48f0e2b6a9a61cc2a381488e1ce5f3a9e9a5fa4fbb20834062721de2b1008a87b48b0ffff0dd7fc93530912e'
        'SKIP')
validpgpkeys=('C9A11B84B6AED0D4D00A43E8D9536D39C966A628') # Stefan Ott <stefan@ott.net>

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

# Not all test files included in tarball
#check() {
#  cd $pkgname-$pkgver
#  python -m unittest discover test
#}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --install-data=/usr/share --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
