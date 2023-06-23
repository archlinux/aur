# Maintainer: Kasimir Wansing <kasimir at wansing dot org>
pkgname=matrix-synapse-imap
pkgver=0.0.5
pkgrel=4
pkgdesc="IMAP auth provider for Synapse"
arch=('any')
url="https://github.com/bit/matrix-synapse-imap"
license=('Apache')
depends=('matrix-synapse')
makedepends=('python')
source=("https://files.pythonhosted.org/packages/source/m/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a6822bd1fdbae56859b202eaa6b3fe8c933ac0f830102d2e3154d64faf1774b0')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	python setup.py build
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
