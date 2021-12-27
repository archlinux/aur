# Maintainer: Your Name <youremail@domain.com>
_name=ledgercomm
pkgname=python-ledgercomm
pkgver=1.1.0
pkgrel=1
pkgdesc="Library to communicate with Ledger Nano S/X and Speculos."
arch=('any')
url="https://github.com/LedgerHQ/ledgercomm"
license=('MIT')
depends=('python>=3.8.0')
makedepends=('python-setuptools')
optdepends=('python-hidapi>=0.9.0.post3: HID interface communication')
source=("https://github.com/LedgerHQ/${_name}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7c8ad124d6f2438c46a2ab3725b8e6fd3e12a8e36df259f605f77207033d70a6')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install \
		--root="$pkgdir" \
		--optimize=1
}
