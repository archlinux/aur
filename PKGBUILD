# Maintainer: Dmitriy Q <krotesk at mail dot ru>
# Contributor: Dmitriy Q <krotesk at mail dot ru>

pkgname="mkdocs-print-site-plugin"
pkgver=2.9
pkgrel=1
pkgdesc="MkDocs Plugin that adds an additional page that combines all pages, allowing easy exports to PDF and standalone HTML."
url="https://github.com/timvink/mkdocs-print-site-plugin"
license=("MIT")
groups=("mkdocs-plugins")
arch=("any")
depends=("mkdocs" "python-hatchling")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools" "python-setuptools-scm")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
options=("!strip")

sha256sums=('43516477fc81d543df2e493736a78581fc1bd7c7a12505545380bd63c2f46d89')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
 python -m installer --destdir="$pkgdir" dist/*.whl
}
