# Maintainer: Stitchless

pkgname=xremap-kde-bin
pkgdesc='Dynamic key remapper for X11 and Wayland (KDE Wayland Version)'
pkgver=0.15.12
pkgrel=2
provides=('xremap')
license=('MIT')
url='https://github.com/xremap/xremap'
arch=('x86_64' 'aarch64')
source=("LICENSE")
source_x86_64=("$url/releases/download/v$pkgver/xremap-linux-x86_64-kde.zip")
source_aarch64=("$url/releases/download/v$pkgver/xremap-linux-aarch64-kde.zip")
b2sums=('5caf7612d5d1e636a60ad68135f621413b3681e4cda0e2e5d5c76e05d3adf15bc7b5cc030c7b26270fa3dfef181456bfd07d1d3330008564f1e82921eef5d16a')
b2sums_x86_64=('3d51bf1528d8580fd7fd9d011be13507a187d151a0a211ef938d88cc25b65b2d67e2c513a0d917b9d367bf3fc71aafba314101aab0a004ffed8ddf16856c76c3')
b2sums_aarch64=('ac6aa45aab7c417cd210d011ad539467d91a5336fbec3673829c49156faca82a657ba0837a51bf1a020134d8826772d6a0fde7b046e4fa747f256290d86851ab')

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
