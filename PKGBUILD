# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=grab-bin
pkgver=2.1.3
pkgrel=1
pkgdesc="Asynchronous file downloader."
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/grab"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=('grab')
conflicts=('grab')
options=('!debug')

source=('LICENSE')
source_x86_64=("grab-x86_64::$url/releases/download/v$pkgver/grab-linux-x86_64")
source_aarch64=("grab-aarch64::$url/releases/download/v$pkgver/grab-linux-aarch64")

sha256sums=('184086b302ece79e686ac701ca404fe7a49499626c82f684dce1b820af59710c')
sha256sums_x86_64=('9d6a51d04bed2ca0873540701cb39ccdadc34c4e81c990a5bfbefdc53cab6123')
sha256sums_aarch64=('61b32f720b50ff3734a46d566f43e1ec219a91e7b4ade3137cedb104cadb7d6f')

package() {
  if [ "$CARCH" == "x86_64" ]; then
    _bin="grab-x86_64"
  elif [ "$CARCH" == "aarch64" ]; then
    _bin="grab-aarch64"
  fi

  # Binaries and Service
  install -Dm755 "$srcdir/$_bin" "$pkgdir/usr/bin/grab"
  
  # License
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
