# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=grab-bin
pkgver=2.1.5
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
source_x86_64=("grab-x86_64-$pkgver-$pkgrel::$url/releases/download/v$pkgver/grab-linux-x86_64")
source_aarch64=("grab-aarch64-$pkgver-$pkgrel::$url/releases/download/v$pkgver/grab-linux-aarch64")

sha256sums=('184086b302ece79e686ac701ca404fe7a49499626c82f684dce1b820af59710c')
sha256sums_x86_64=('c09b4627ee65fba353fdf475739dab941aa52f870a03d47fe607724f68178d06')
sha256sums_aarch64=('eab0226faf794dc5181b5879e6815c0a5ebdfc05fbbbe42e2592e032e011db99')

package() {
  if [ "$CARCH" == "x86_64" ]; then
    _bin="grab-x86_64-$pkgver-$pkgrel"
  elif [ "$CARCH" == "aarch64" ]; then
    _bin="grab-aarch64-$pkgver-$pkgrel"
  fi

  # Binaries and Service
  install -Dm755 "$srcdir/$_bin" "$pkgdir/usr/bin/grab"
  
  # License
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
