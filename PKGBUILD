# Maintainer: Dmitriy Q <krotesk at mail dot ru>
# Contributor: Dmitriy Q <krotesk at mail dot ru>

pkgname="mkdocs-print-site-plugin"
pkgver=2.7.1
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

sha256sums=('7541055e7a198347c2e8d81f4d42d1833541b4111d524fd2d5954267992595af')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
 python -m installer --destdir="$pkgdir" dist/*.whl
}
