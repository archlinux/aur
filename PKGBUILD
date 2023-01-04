#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=cheat-bin
pkgver=4.4.0
pkgrel=2
pkgdesc="cheat allows you to create and view interactive cheatsheets on the command-line"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
conflicts=('cheat')
provides=('cheat')
source=(
  "https://raw.githubusercontent.com/cheat/cheat/$pkgver/scripts/cheat.bash"
  "https://raw.githubusercontent.com/cheat/cheat/$pkgver/scripts/cheat.fish"
  "https://raw.githubusercontent.com/cheat/cheat/$pkgver/scripts/cheat.zsh"
)
sha256sums=(
  "79d70e84c429b7e177c19ef942c0a7f5ad6a2e41ffb5b220188af93717fd522b"
  "df8ebb9f47422219b97d8f3ceadc1cf2cc92d14f848a982ff905ef00b1a956de"
  "7821074282fddb93d21f8a544c058ea8cbb0cb68cee9ef1049d693aa76e43811"
)
source_i686=("$pkgname-$pkgver.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-386.gz")
source_x86_64=("$pkgname-$pkgver.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-amd64.gz")
source_armv5h=("$pkgname-$pkgver.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-arm5.gz")
source_armv6h=("$pkgname-$pkgver.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-arm6.gz")
source_armv7h=("$pkgname-$pkgver.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-arm7.gz")
source_aarch64=("$pkgname-$pkgver.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-arm64.gz")
url="https://github.com/cheat/cheat"
license=("MIT")
sha256sums_i686=("d3be497a49aba082cad5f920145de69356d8592eee25feedb7de27b09502fe63")
sha256sums_x86_64=("f975e6df9b1226a4405e727b3222a0d6a58f2237cc449e12588d8df5eb713a59")
sha256sums_armv5h=("662efb4c7aeaf356dc83ec0b9370b134312746b405624935f678b890a526bafc")
sha256sums_armv6h=("420c344ed29a97054d9e7412bf8b297450b0fa76f1e049d1a09f422547237352")
sha256sums_armv7h=("59948d3e8041392c86c72b948377ba3a26c33dd9c2ee538c158829615b927059")
sha256sums_aarch64=("b16845434c75519728747d19c566c6dd47778a04694fb245d3ed78da04f9a157")

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/cheat"

  # Install completion scripts
  install -Dm644 "cheat.bash" "$pkgdir/usr/share/bash-completion/completions/cheat"
  install -Dm644 "cheat.fish" "$pkgdir/usr/share/fish/vendor_completions.d/cheat.fish"
  install -Dm644 "cheat.zsh" "$pkgdir/usr/share/zsh/site-functions/_cheat"
}
