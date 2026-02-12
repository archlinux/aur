# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=grab-bin
pkgver=2.1.1
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
sha256sums_x86_64=('7892e602cc807357d7936e64bfcc06afe145e720521dc19c430c4c0874fc60c4')
sha256sums_aarch64=('96fe3a5801658773853da43c2bd69abcbbfbc71f92e5e1bbaf0852a88b984328')

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
