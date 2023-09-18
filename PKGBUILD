# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Sergey Mastykov

_name=LinkChecker
pkgname=linkchecker
pkgver=10.3.0
pkgrel=1
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
b2sums=('2ddf216742df3200e740032b55e6349bc45ae1ae87560595f55153737a17975659dace1c5521cb7c211ec9b64323bc3a1afc7e214a538e9eb05ef4a6d1101365')

build() {
    cd $pkgname-$pkgver
    hatchling build
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
