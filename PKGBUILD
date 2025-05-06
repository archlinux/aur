# Maintainer: Zentino <Zylsjsp@gmail.com>
_name=certbot-pkcs12
pkgname=python-${_name}
pkgver=0.2.1
pkgrel=1
pkgdesc="PKCS#12 installer plugin for Certbot and Let's Encrypt"
arch=('any')
url="https://github.com/nasa-gcn/certbot-pkcs12"
license=('Apache-2.0')
depends=('certbot' 'python-pyopenssl<24.1')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nasa-gcn/certbot-pkcs12/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7d0d21b59314e6ca54c0dd32f5d1560f4854d5d2435c88dfce3c90f03235aa3a')

build() {
	cd "${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}


package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
