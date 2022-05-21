# Maintainer: Daniel <echo 'a2luZ2RyZWFkQGdteC5kZQo=' | base64 -d>

pkgname=pdfannots-git
pkgdesc='Extracts and formats text annotations from a PDF file'
url='https://github.com/0xabu/pdfannots'
license=('MIT')
pkgver=0.3.r20.g43b574d
pkgrel=1
arch=('any')
source=("git+https://github.com/0xabu/pdfannots")
sha256sums=('SKIP')
makedepends=('python-setuptools' 'git')
depends=('python-pdfminer')

pkgver() {
    cd "pdfannots"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "pdfannots"
    python setup.py build
}

package() {
    cd "pdfannots"
    python setup.py install --root="$pkgdir" --optimize=1
}
