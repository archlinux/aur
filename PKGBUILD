# Maintainer: Stitchless

pkgname=xremap-kde-bin
pkgdesc='Dynamic key remapper for X11 and Wayland (KDE Wayland Version)'
pkgver=0.15.12
pkgrel=1
provides=('xremap')
license=('MIT')
url='https://github.com/xremap/xremap'
arch=('x86_64' 'aarch64')
source=("LICENSE")
source_x86_64=("$url/releases/download/v$pkgver/xremap-linux-x86_64-kde.zip")
source_aarch64=("$url/releases/download/v$pkgver/xremap-linux-aarch64-kde.zip")
b2sums=('5caf7612d5d1e636a60ad68135f621413b3681e4cda0e2e5d5c76e05d3adf15bc7b5cc030c7b26270fa3dfef181456bfd07d1d3330008564f1e82921eef5d16a')
b2sums_x86_64=('bd6bfd3e106ff9088add6f967239e4773c8af29f5a4484d83e4c7bfe193f991d228560908564ef5f90fb2a255c4063f33906d24000037359aabcf8e41fdc3134')
b2sums_aarch64=('b0e6121afdc92f26cd2ef2c4f2dfc55746a23a48fcca9c332c8f6f41b2395ecf0046fa315033c81ee3d7454b0e3aedb083aa6bb3062491b59788eb224dfa3293')

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
