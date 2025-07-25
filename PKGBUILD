# Maintainer: Dmitriy Q <krotesk at mail dot ru>
# Contributor: Dmitriy Q <krotesk at mail dot ru>

pkgname="mkdocs-print-site-plugin"
pkgver=2.7.3
pkgrel=2
pkgdesc="MkDocs Plugin that adds an additional page that combines all pages, allowing easy exports to PDF and standalone HTML."
url="https://timvink.github.io/mkdocs-print-site-plugin/"
license=("MIT")
groups=("mkdocs-plugins")
arch=("any")
depends=("mkdocs" "python-hatchling")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
options=("!strip")

sha256sums=('b4d864be95dd5537c5a44ec7194385f4ba496000077fb8c5c58f62f9ab68f2da')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
 python -m installer --destdir="$pkgdir" dist/*.whl
}
