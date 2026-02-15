#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=cheat-bin
pkgver=4.7.1
pkgrel=1
pkgdesc="cheat allows you to create and view interactive cheatsheets on the command-line"
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h' 'aarch64')
license=("MIT")
conflicts=('cheat')
provides=('cheat')
source=(
  "https://raw.githubusercontent.com/cheat/cheat/$pkgver/scripts/cheat.bash"
  "https://raw.githubusercontent.com/cheat/cheat/$pkgver/scripts/cheat.fish"
  "https://raw.githubusercontent.com/cheat/cheat/$pkgver/scripts/cheat.zsh"
)
source_i686=("$pkgname-$pkgver-i686.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-386.gz")
source_x86_64=("$pkgname-$pkgver-x86_64.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-amd64.gz")
source_armv5h=("$pkgname-$pkgver-armv5h.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-arm5.gz")
source_armv6h=("$pkgname-$pkgver-armv6h.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-arm6.gz")
source_armv7h=("$pkgname-$pkgver-armv7h.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-arm7.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-arm64.gz")
url="https://github.com/cheat/cheat"
sha256sums=('79d70e84c429b7e177c19ef942c0a7f5ad6a2e41ffb5b220188af93717fd522b'
            'df8ebb9f47422219b97d8f3ceadc1cf2cc92d14f848a982ff905ef00b1a956de'
            '7821074282fddb93d21f8a544c058ea8cbb0cb68cee9ef1049d693aa76e43811')
sha256sums_i686=('aaff16807d815557f38798974ecba4638c30c251c1383657c3e32d6ae7904ed0')
sha256sums_x86_64=('6f5fb969ddbfe4173c3489d5f6232624b38d93271f7afec4e9a02310fb24efab')
sha256sums_armv5h=('2626fb7c3a4eec9d9f15015a934fb1e71e6ca88376fce328838072eef9743780')
sha256sums_armv6h=('966dd5eac5c3308bfce251c84f08e02b20196b0dc5fd5bc514c37d05d059e738')
sha256sums_armv7h=('2913b9f9fe41bade388647edeb44ee2654690c7bf1b6564e1cdbe952abab96a4')
sha256sums_aarch64=('8d517b876aae3ca34978cd4d1854e5ceb307c53f9c0981920d3d7a070bab428f')

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/cheat"

  # Install completion scripts
  install -Dm644 "cheat.bash" "$pkgdir/usr/share/bash-completion/completions/cheat"
  install -Dm644 "cheat.fish" "$pkgdir/usr/share/fish/vendor_completions.d/cheat.fish"
  install -Dm644 "cheat.zsh" "$pkgdir/usr/share/zsh/site-functions/_cheat"
}
