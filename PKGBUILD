# Maintainer: Chaos-Tic <58691435+Chaos-Tic@users.noreply.github.com>
pkgname=chaostictool
pkgver=1.5.0
pkgrel=1
pkgdesc='Terminal interface for authorized security testing'
arch=('any')
url='https://github.com/Chaos-Tic/Chaostic-Tool'
license=('MIT')
depends=('python>=3.11' 'python-rich>=13.7' 'python-prompt_toolkit>=3')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Filled from the release archive by scripts/prepare-aur.py before publication.
sha256sums=('ca5bfb246f911a94c8645441e3fdbb415aba0d8cd6d00848cc1532711061840e')

build() {
    cmake -S "Chaostic-Tool-$pkgver" -B build -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
