# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Cedric Staub <cs+aur {at} cssx.cc>

pkgname=episoder
pkgver=0.9.2
pkgrel=1
pkgdesc='Tool to tell you about new episodes of your favourite TV shows'
arch=('any')
url=https://code.ott.net/episoder/
license=('GPL3')
depends=('python-argparse' 'python-beautifulsoup4' 'python-requests'
         'python-sqlalchemy')
makedepends=('python-setuptools')
source=("$url/downloads/$pkgname-$pkgver.tar.gz"{,.asc})
b2sums=('7abf36e09f1ade035d82c5515b54f7bcf38190f1b9b309b29e7fbaa40b525ab955504c136e6d92c5d86bfb8afeaeab16d7b43ecce3bd5f1f4ae20331c65863db'
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
