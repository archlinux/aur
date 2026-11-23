# Maintainer: shurizzle
# Prebuilt static musl binaries from the `vX.Y.Z` GitHub releases (.github/workflows/release.yml).
pkgname=hum-bin
pkgver=0.1.4
pkgrel=1
pkgdesc='Terminal Spotify client'
arch=('x86_64' 'aarch64')
url='https://github.com/shurizzle/hum'
license=('MIT')
depends=('spotify-soloist')
options=('!debug' '!strip')
source=('LICENSE')
source_x86_64=("hum-x86_64-$pkgver.tar.gz::$url/releases/download/v$pkgver/hum-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("hum-aarch64-$pkgver.tar.gz::$url/releases/download/v$pkgver/hum-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('2c3b4fdd3a8cc2935b26589628de020fa1a701455797080901b8191bd6ae0eb2')
sha256sums_x86_64=('0116fd709b903fd1e1d67351de1ab3c284b064ca7c5abfc631ebc2034b02a1a8')
sha256sums_aarch64=('8104cca385b5d1aa38b8df2278c9791b5359fd1de80d58e30e3924d7ee92aabe')

package() {
  install -Dm755 hum "$pkgdir/usr/bin/hum"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  "$pkgdir/usr/bin/hum" completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/hum"
  "$pkgdir/usr/bin/hum" completions zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_hum"
  "$pkgdir/usr/bin/hum" completions fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/hum.fish"
}
