# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=grab-bin
pkgver=2.1.4
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
sha256sums_x86_64=('b68c4d347cbc437155c80e3240e02b0db47a82ebe4f99cc2b3f0a761e5e3610a')
sha256sums_aarch64=('5a4e8bd4ce9d172b426a7709477a1af2a3c35d48af6f5f77a37ee3f413b9928e')

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
