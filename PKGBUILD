# Maintainer: Daniel <echo 'a2luZ2RyZWFkQGdteC5kZQo=' | base64 -d>

pkgname=pdfannots-git
pkgdesc='Extracts and formats text annotations from a PDF file'
url='https://github.com/0xabu/pdfannots'
license=('MIT')
pkgver=0.4.r22.g09b9867
pkgrel=1
arch=('any')
source=("git+https://github.com/0xabu/pdfannots")
sha256sums=('SKIP')
makedepends=('python-hatchling' 'python-installer' 'python-build' 'git')
depends=('python-pdfminer')

pkgver() {
    cd "pdfannots"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "pdfannots"
    python -m build --wheel --no-isolation
}

package() {
    cd "pdfannots"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
