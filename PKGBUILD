# Maintainer: Stitchless

pkgname=xremap-kde-bin
pkgdesc='Dynamic key remapper for X11 and Wayland (KDE Wayland Version)'
pkgver=0.15.18
pkgrel=1
provides=('xremap')
license=('MIT')
url='https://github.com/xremap/xremap'
arch=('x86_64' 'aarch64')
source=("LICENSE")
source_x86_64=("$url/releases/download/v$pkgver/xremap-linux-x86_64-kde.zip")
source_aarch64=("$url/releases/download/v$pkgver/xremap-linux-aarch64-kde.zip")
b2sums=('5caf7612d5d1e636a60ad68135f621413b3681e4cda0e2e5d5c76e05d3adf15bc7b5cc030c7b26270fa3dfef181456bfd07d1d3330008564f1e82921eef5d16a')
b2sums_x86_64=('8ce744a6fa51ee349840de7e88b81a5a5ef9db3af2ad772c16792a5e03ea42e231317a531eb94948744ffa96db596db0df7a07777760137e5b965d49690ab189')
b2sums_aarch64=('ba6de1e612ca2378fac8ec58c67fbe03686bb5b8f456a83c74703d4eb84d40a25269b87aa1f7ce26dd3ee34a06cd0d869d9093a63ba4b49a3d845b3ab0976597')

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
