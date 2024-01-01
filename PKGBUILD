# Maintainer: Luke Arms <luke@arms.to>
pkgname=render50
pkgver=9.2.7
pkgrel=1
pkgdesc="Generate syntax-highlighted PDFs of source code"
arch=('any')
url="https://github.com/cs50/render50"
license=('GPL3')
depends=('python' 'python-backports.shutil_get_terminal_size' 'python-beautifulsoup4' 'python-braceexpand' 'python-natsort' 'python-pygments' 'python-pypdf' 'python-requests' 'python-termcolor' 'python-weasyprint')
makedepends=('python-setuptools')
sha256sums=('3cb9b7697adc246a689ae40afa12746d50f9ba301f5d0b9e008b1219f7bb0614')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
