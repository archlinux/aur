# Maintainer: Luke Arms <luke@arms.to>
pkgname=render50
pkgver=9.2.10
pkgrel=1
pkgdesc="Render source code as PDFs"
arch=('any')
url="https://github.com/cs50/render50"
license=('GPL3')
depends=('python' 'python-backports.shutil_get_terminal_size' 'python-beautifulsoup4' 'python-braceexpand' 'python-natsort' 'python-pygments' 'python-pypdf' 'python-requests' 'python-termcolor' 'python-weasyprint')
makedepends=('python-setuptools')
sha256sums=('24749cfc404ab8acb10f812ad8b9e3c8c5caa1c9004a1e8042d9b0624c9c5a9f')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
