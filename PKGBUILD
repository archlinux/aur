# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Sergey Mastykov

_name=LinkChecker
pkgname=linkchecker
pkgver=10.3.0
pkgrel=2
pkgdesc="check links in web documents or full websites"
arch=('any')
url="https://github.com/linkcheck/linkchecker"
license=('GPL2')
depends=('python>=3.8' 'python-beautifulsoup4>=4.8.1' 'python-dnspython>=2.0' 'python-requests>=2.20')
makedepends=('python-hatch-vcs' 'python-hatchling>=1.8.0' 'python-installer' 'python-polib' 'python-setuptools-scm>=7.1.0')
optdepends=(
    'python-argcomplete>=1.8.1: For command-line completion'
    'python-pdfminer>=20181108: For reading PDF files'
)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('af2451858c8a95d581e465dbe014b5e24667617f0cbbcc40100b2c1c29df2078e6bbb46b889e4dcd4457174ab19b0e23dbdb7872c8de7ad557e44101f37eefa3')

build() {
    cd $pkgname-$pkgver
    hatchling build
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
