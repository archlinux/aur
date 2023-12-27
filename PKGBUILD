# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Sergey Mastykov

_name=LinkChecker
pkgname=linkchecker
pkgver=10.4.0
pkgrel=1
pkgdesc="check links in web documents or full websites"
arch=('any')
url="https://github.com/linkcheck/linkchecker"
license=('GPL2')
depends=('python>=3.9' 'python-beautifulsoup4>=4.8.1' 'python-dnspython>=2.0' 'python-requests>=2.20')
makedepends=('python-hatch-vcs' 'python-hatchling>=1.8.0' 'python-installer' 'python-polib' 'python-setuptools-scm>=7.1.0')
optdepends=(
    'python-argcomplete>=1.8.1: For command-line completion'
    'python-pdfminer>=20181108: For reading PDF files'
)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('d4088d0852fca1c8e04deb6f9ca45fcda1e8b85d08154d42e00b5c5dea9f66c502f4eed658b71b10abbea64b7e6be1d92f45c9b88c7e23a70503e0e0292c8a0d')

build() {
    cd $pkgname-$pkgver
    hatchling build
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
