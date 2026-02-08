# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=fsid
pkgver=0.1.0b
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
sha256sums_x86_64=('928a7fd2e92a9e12227b470278cd1304803d8d14e20144f8e79814b9fee7a4ed')
sha256sums_aarch64=('149287ae7adf5b246d5dd3dcfcd391b7d903d1b249377442655d2660054a574f')

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
