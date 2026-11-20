# Maintained by the Project Z upstream: github.com/LIghtJUNction/zfetch
pkgname=zfetch-project-z-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='A tiny native Linux system summary from Project Z (official static binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/zfetch'
license=('MIT')
provides=('zfetch')
conflicts=('zfetch')
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/zfetch-$pkgver-linux-x86_64.tar.gz")
sha256sums_x86_64=('c6309ca85ee14dbfc18d5ec81124f66f57b73b4d5936a0bec56fdefb277aa405')
source_aarch64=("$url/releases/download/v$pkgver/zfetch-$pkgver-linux-aarch64.tar.gz")
sha256sums_aarch64=('f4bad574343080d0bcf33a22cea89ffd55845dd25b89a9dc24e009b46f1d3b25')

package() {
  cd "zfetch-$pkgver-linux-$CARCH"
  install -Dm755 bin/zfetch "$pkgdir/usr/bin/zfetch"
  install -Dm644 share/man/man1/zfetch.1 "$pkgdir/usr/share/man/man1/zfetch.1"
  install -Dm644 share/zsh/site-functions/_zfetch "$pkgdir/usr/share/zsh/site-functions/_zfetch"
  install -Dm644 share/licenses/zfetch/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
