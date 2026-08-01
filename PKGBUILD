# Maintainer: tee < teeaur at duck dot com >
pkgname=rayfish-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="P2P mesh VPN powered by iroh"
arch=(x86_64)
url='https://rayfish.xyz'
license=(MPL-2.0)
provides=(rayfish)
conflicts=(rayfish)
source=("rayfish-$pkgver.sha256::https://github.com/rayfish/rayfish/releases/download/v$pkgver/ray-linux-x86_64.sha256")
source_x86_64=("rayfish-$pkgver::https://github.com/rayfish/rayfish/releases/download/v$pkgver/ray-linux-x86_64")
b2sums=(SKIP)
b2sums_x86_64=('815e3548b98b114497d5c6484ec23e6ec48bc04db6b720d28ce17c196ab5c77b877e2179710adc9e226e0fdf51861961043fa1ef20daab197f8a4dd2174e8159')

package() {
  install -Dm755 "rayfish-$pkgver" "$pkgdir/usr/bin/ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/ray.fish"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions zsh  2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions elvish 2>/dev/null) "$pkgdir/usr/share/elvish/lib/ray.elv"
}
