# Maintainer: Stitchless

pkgname=xremap-kde-bin
pkgdesc='Dynamic key remapper for X11 and Wayland (KDE Wayland Version)'
pkgver=0.15.19
pkgrel=1
provides=('xremap')
license=('MIT')
url='https://github.com/xremap/xremap'
arch=('x86_64' 'aarch64')
source=("LICENSE")
source_x86_64=("$url/releases/download/v$pkgver/xremap-linux-x86_64-kde.zip")
source_aarch64=("$url/releases/download/v$pkgver/xremap-linux-aarch64-kde.zip")
b2sums=('5caf7612d5d1e636a60ad68135f621413b3681e4cda0e2e5d5c76e05d3adf15bc7b5cc030c7b26270fa3dfef181456bfd07d1d3330008564f1e82921eef5d16a')
b2sums_x86_64=('d5d4b2356c5cbf46ed661c8d9b02694e69610519b67a25d600da23abe72a9d9f81f5607214379b81fb4b152c041493b57dacd309cea194a2d1b6c46e8bb168b5')
b2sums_aarch64=('82de6a7ac0312fdf82e2c9df88e747fc4853a53d73a109e419e76c4e4bf21ff2a88174e402a1b9982066dea54bb94243dfd348d0e9e8f0748e590cad5b6be0c7')

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
