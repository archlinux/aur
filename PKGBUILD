# Maintainer: Dmitriy Q <krotesk at mail dot ru>
# Contributor: Dmitriy Q <krotesk at mail dot ru>

pkgname="mkdocs-print-site-plugin"
pkgver=2.6.0
pkgrel=1
pkgdesc="MkDocs Plugin that adds an additional page that combines all pages, allowing easy exports to PDF and standalone HTML."
url="https://github.com/timvink/mkdocs-print-site-plugin"
license=("MIT")
groups=("mkdocs-plugins")
arch=("any")
depends=("mkdocs" "python-hatchling")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
options=("!strip")

sha256sums=('50be764ea5775f927730cdae5ec56105c0a7eb44083d23216ec35b00cd436966')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
 python -m installer --destdir="$pkgdir" dist/*.whl
}
