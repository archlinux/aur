# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=grab-bin
pkgver=2.1.2
pkgrel=2
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
sha256sums_x86_64=('949824d9a2a4f02b6887d86514a71275be20b902150d7c64acdb2960824b736b')
sha256sums_aarch64=('0cbbef534e1a960118a1a362952b799b3165bb54b1e181ff392634899a6b271f')

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
