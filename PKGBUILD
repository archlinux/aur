# Maintainer: SonOfMithras <ammar.alriyamy@gmail.com>
pkgname=plasma-theme-master
pkgver=2.0.7
pkgrel=1
pkgdesc="Daemon and GUI to generate/synchronize and control theme dynamically across KDE Plasma and universal applications"
arch=('x86_64')
url="https://github.com/SonOfMithras/plasma-theme-master"
license=('MIT')
depends=('qt6-base' 'kconfig' 'kcoreaddons' 'kcolorscheme')
makedepends=('cmake' 'extra-cmake-modules')
optdepends=('python-pipx: for Material You color generation support'
            'kvantum: for Kvantum theme support'
            'klassy: for window decoration preset switching support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ce6bc1c7788dee3582e1e7cd3909a07e5bc14ace5ad9156769dfb4a06c7f689d')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
