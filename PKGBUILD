# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-mailman-hyperkitty-plugin')
_pkgbase='mailman-hyperkitty'
_commit=10da29c4a036bec8ee12dd7c6c254b25d9fd8eeb
pkgver=1.0.0
pkgrel=1
pkgdesc="Hyperkitty archive plugin for mailman"
arch=(any)
makedepends=('python-setuptools')
depends=('mailman-core' 'python-setuptools' 'python-requests')
url="https://gitlab.com/mailman/mailman-hyperkitty"
license=('GPL')
options=(!emptydirs)
source=("${_pkgbase}-${pkgver}.tar.gz::https://gitlab.com/mailman/mailman-hyperkitty/repository/archive.tar.gz?ref=v${pkgver}")
sha256sums=('b52fcbf6c4ecbde47569fd147ac4251dc76f6c66a28f4d4045864211d5f6b26b')

package() {
  cd "$srcdir/$_pkgbase-v$pkgver-$_commit"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
