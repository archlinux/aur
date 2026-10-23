# Maintainer: Chaos-Tic <58691435+Chaos-Tic@users.noreply.github.com>
pkgname=chaostictool-desktop
pkgver=1.3.0
pkgrel=1
pkgdesc='Desktop workspace for authorized security testing'
arch=('any')
url='https://github.com/Chaos-Tic/Chaostic-Tool'
license=('MIT')
depends=('python>=3.11' 'pyside6>=6.8' 'python-psutil' 'python-dnspython' 'python-py7zr' 'python-pyte')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/desktop-v$pkgver.tar.gz")
sha256sums=('888cfa35c8b2dc58bec112a3df3861efaaccf0e2d34ac9d19929bae57e37549e')
build() {
    cmake -S "Chaostic-Tool-desktop-v$pkgver" -B build -DCMAKE_INSTALL_PREFIX=/usr
}
package() {
    DESTDIR="$pkgdir" cmake --install build
}
