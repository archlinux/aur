# Maintainer: Alexandr Parkhomenko

_module=yfinance
pkgname=python-yfinance-git
pkgver=1
pkgrel=1
pkgdesc="Yahoo! Finance market data downloader (+faster Pandas Datareader) "
url="https://github.com/ranaroussi/yfinance"
depends=('python-requests' 'python-multitasking-git')
makedepends=('python-setuptools')
license=('apache2')
arch=('any')
source=("git://github.com/ranaroussi/yfinance")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_module}"
    git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
    cd "${srcdir}/${_module}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

