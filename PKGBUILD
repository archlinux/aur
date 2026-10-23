# Maintainer: Chaos-Tic <58691435+Chaos-Tic@users.noreply.github.com>
pkgname=chaostictool
pkgver=1.4.0
pkgrel=1
pkgdesc='Terminal interface for authorized security testing'
arch=('any')
url='https://github.com/Chaos-Tic/Chaostic-Tool'
license=('MIT')
depends=('python>=3.11' 'python-rich>=13.7' 'python-prompt_toolkit>=3')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Filled from the release archive by scripts/prepare-aur.py before publication.
sha256sums=('ad9c690e89b2d62a8ae5e3c32207f5b029b549c7c7b391220e1efe67d1b541d6')

build() {
    cmake -S "Chaostic-Tool-$pkgver" -B build -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
