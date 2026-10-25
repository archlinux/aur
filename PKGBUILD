# Maintainer: Stitchless

pkgname=xremap-kde-bin
pkgdesc='Dynamic key remapper for X11 and Wayland (KDE Wayland Version)'
pkgver=0.15.16
pkgrel=1
provides=('xremap')
license=('MIT')
url='https://github.com/xremap/xremap'
arch=('x86_64' 'aarch64')
source=("LICENSE")
source_x86_64=("$url/releases/download/v$pkgver/xremap-linux-x86_64-kde.zip")
source_aarch64=("$url/releases/download/v$pkgver/xremap-linux-aarch64-kde.zip")
b2sums=('5caf7612d5d1e636a60ad68135f621413b3681e4cda0e2e5d5c76e05d3adf15bc7b5cc030c7b26270fa3dfef181456bfd07d1d3330008564f1e82921eef5d16a')
b2sums_x86_64=('bb57f7ba6a91748c33a11ed7c07b3ad44c49bc4fd6edee6739d56ee2965e108413c49793fc8bc32d7f27305717aee945d7b4554c77ddc13378d331b9803220f7')
b2sums_aarch64=('38dcf1d0ed4c55c5e9baff34ae78adc00a83739385bfaae003367d4682ec7ad0ece6fe4f9af6e176b754a00428ac81968560f2993f800d25a5d14646f4692337')

package() {
  ./xremap --completions zsh > zsh_completions
  ./xremap --completions fish > fish_completions
  ./xremap --completions bash > bash_completions
  install -Dm644 zsh_completions "$pkgdir/usr/share/zsh/site-functions/_xremap"
  install -Dm644 fish_completions "$pkgdir/usr/share/fish/vendor_completions.d/xremap.fish"
  install -Dm644 bash_completions "$pkgdir/usr/share/bash-completion/completions/xremap"
  install -Dm755 xremap "$pkgdir/usr/bin/xremap"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
