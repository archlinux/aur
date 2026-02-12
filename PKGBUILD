# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=grab-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Asynchronous file downloader."
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/grab"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=('grab')
conflicts=('grab')

source=('LICENSE')
source_x86_64=("grab-x86_64::$url/releases/download/v$pkgver/grab-linux-x86_64")
source_aarch64=("grab-aarch64::$url/releases/download/v$pkgver/grab-linux-aarch64")

sha256sums=('184086b302ece79e686ac701ca404fe7a49499626c82f684dce1b820af59710c')
sha256sums_x86_64=('0996cbc2fe6772a99718bf3c7bf564bb48165971cf4c4820ae96dd68156d1c36')
sha256sums_aarch64=('8e395d13b31bfafee0b11009d49361851836b520ad1878bc0c53551d520cc915')

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
