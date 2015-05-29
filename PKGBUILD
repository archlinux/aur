# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=percol
pkgver=0.1.0
pkgrel=1
pkgdesc="Adds flavor of interactive filtering to the traditional pipe concept of UNIX shell"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-cmigemo')
url="https://github.com/mooz/percol"
license=('MIT')
options=(!emptydirs)
source=(https://github.com/mooz/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('bc47dceef46d3e8443a166e30a0c5c6f36992bb6c2775e07110fc01a82d7699d')
conflicts=('percol-git')
changelog="ChangeLog"

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  msg 'Installing...'
  python setup.py install --root="${pkgdir}" --optimize=1
}
