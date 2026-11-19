# Maintained by the Project Z upstream: github.com/LIghtJUNction/zfetch
pkgname=zfetch-project-z-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='A tiny native Linux system summary from Project Z (official static binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/zfetch'
license=('MIT')
provides=('zfetch')
conflicts=('zfetch')
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/zfetch-$pkgver-linux-x86_64.tar.gz")
sha256sums_x86_64=('9dbb856645309e89f2ce2cd191588f3206bbffd4e1806c18ccd381bc7346e606')
source_aarch64=("$url/releases/download/v$pkgver/zfetch-$pkgver-linux-aarch64.tar.gz")
sha256sums_aarch64=('b2874564e9e40242b2be219b721e0ba69b0c906bd8be74ea1336227e9d2a0918')

package() {
  cd "zfetch-$pkgver-linux-$CARCH"
  install -Dm755 bin/zfetch "$pkgdir/usr/bin/zfetch"
  install -Dm644 share/man/man1/zfetch.1 "$pkgdir/usr/share/man/man1/zfetch.1"
  install -Dm644 share/zsh/site-functions/_zfetch "$pkgdir/usr/share/zsh/site-functions/_zfetch"
  install -Dm644 share/licenses/zfetch/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
