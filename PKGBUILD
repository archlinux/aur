# Maintainer: hashworks <mail@hashworks.net>
pkgname=certbot-dns-hetzner-git
pkgdesc="Certbot plugin enabling dns-01 challenge on the Hetzner DNS API"
pkgver=r27.34aed9b
pkgrel=1
arch=(any)
url="https://github.com/ctrlaltcoop/certbot-dns-hetzner"
license=(Apache)
depends=(certbot)
makedepends=(python-setuptools)
provides=(certbot-dns-hetzner)
source=("certbot-dns-hetzner::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/certbot-dns-hetzner"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/certbot-dns-hetzner"
	python setup.py install --root="${pkgdir}"
}
