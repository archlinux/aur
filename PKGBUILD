# Maintainer: Chaos-Tic <58691435+Chaos-Tic@users.noreply.github.com>
pkgname=chaostictool-desktop
pkgver=1.2.0
pkgrel=1
pkgdesc='Desktop workspace for authorized security testing'
arch=('any')
url='https://github.com/Chaos-Tic/Chaostic-Tool'
license=('MIT')
depends=('python>=3.11' 'pyside6>=6.8' 'python-psutil' 'python-dnspython' 'python-py7zr' 'python-pyte')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/desktop-v$pkgver.tar.gz")
sha256sums=('115242cab0a3a7c7cbd447072487330eef405ac108e044f431ba7ef2b383f7b1')
build() {
    cmake -S "Chaostic-Tool-desktop-v$pkgver" -B build -DCMAKE_INSTALL_PREFIX=/usr
}
package() {
    DESTDIR="$pkgdir" cmake --install build
}
