# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=fsid
pkgver=0.1.1
pkgrel=1
pkgdesc="A self-contained identifier for files and directories."
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/fsid"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=('fsid')
conflicts=('fsid')

source=('LICENSE')
source_x86_64=("fsid-x86_64::$url/releases/download/v$pkgver/fsid-linux-x86_64")
source_aarch64=("fsid-aarch64::$url/releases/download/v$pkgver/fsid-linux-aarch64")

sha256sums=('184086b302ece79e686ac701ca404fe7a49499626c82f684dce1b820af59710c')
sha256sums_x86_64=('68df0f8fe12dcac4bfd54372f6f88f4c595f9fd3e26f2b9ad516d4b814da9d3b')
sha256sums_aarch64=('a3859aad4d6e3c8ba9d2cf99d8fcab9c01018f90b8b0d067a97fc3d0aa6b6998')

package() {
  if [ "$CARCH" == "x86_64" ]; then
    _bin="fsid-x86_64"
  elif [ "$CARCH" == "aarch64" ]; then
    _bin="fsid-aarch64"
  fi

  # Binaries and Service
  install -Dm755 "$srcdir/$_bin" "$pkgdir/usr/bin/fsid"
  
  # License
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
