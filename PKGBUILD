# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=undead
pkgver=0.1.2
pkgrel=1
pkgdesc="A minimal CLI chat client for OpenAI-compatible APIs with workspace and MCP support."
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/undead"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=('undead')
conflicts=('undead')
options=('!debug')

source=('LICENSE')
source_x86_64=("undead-x86_64-$pkgver-$pkgrel::$url/releases/download/v$pkgver/undead-linux-x86_64")
source_aarch64=("undead-aarch64-$pkgver-$pkgrel::$url/releases/download/v$pkgver/undead-linux-aarch64")

sha256sums=('184086b302ece79e686ac701ca404fe7a49499626c82f684dce1b820af59710c')
sha256sums_x86_64=('d9f37cf836c6a38b470f9c825667027e963045bb33e66526247732dedef59ef9')
sha256sums_aarch64=('8f4cd9857810f0aeb2217629f5e8ccf9910bb2dbe8b5a0cf21da5cd914726a88')

package() {
  if [ "$CARCH" == "x86_64" ]; then
    _bin="undead-x86_64-$pkgver-$pkgrel"
  elif [ "$CARCH" == "aarch64" ]; then
    _bin="undead-aarch64-$pkgver-$pkgrel"
  fi

  # Binaries and Service
  install -Dm755 "$srcdir/$_bin" "$pkgdir/usr/bin/undead"

  # License
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
