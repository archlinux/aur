#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=cheat-bin
pkgver=4.4.2
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
sha256sums_i686=('1ee7f6b4b40447684c80f3920b1841cb54d9f3f8cd543671c2453c34769cdde1')
sha256sums_x86_64=('b81f5ba21f134087c0294d809f89e5442d641d7be297bb128807cbce00849e9b')
sha256sums_armv5h=('6f3aa9911ead36d71008a45adb553da0c00320748dbd4547989d443e6d6cea53')
sha256sums_armv6h=('da7bfe1ec1812d822dc897ca0793b6c804e8079bdd997b87327f7d1349a30bf4')
sha256sums_armv7h=('52ca1e355f46ae36b04717e431ef03b6158e41d1df0c3cf381abe36a147dfe43')
sha256sums_aarch64=('08e1741e4d7e0ad9fc5055d70ab1985e53ed0ed8070930b5d93569c8239d0d83')

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/cheat"

  # Install completion scripts
  install -Dm644 "cheat.bash" "$pkgdir/usr/share/bash-completion/completions/cheat"
  install -Dm644 "cheat.fish" "$pkgdir/usr/share/fish/vendor_completions.d/cheat.fish"
  install -Dm644 "cheat.zsh" "$pkgdir/usr/share/zsh/site-functions/_cheat"
}
