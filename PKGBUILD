# Maintainer: hashworks <mail@hashworks.net>
pkgname=certbot-dns-hetzner-git
pkgdesc="Certbot plugin enabling dns-01 challenge on the Hetzner DNS API"
pkgver=r27.34aed9b
pkgrel=1
arch=(any)
url="https://github.com/ctrlaltcoop/certbot-dns-hetzner"
license=(Apache)
depends=(certbot)
makedepends=(python-setuptools git)
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	python setup.py install --root="${pkgdir}"
}
