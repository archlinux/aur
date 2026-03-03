# Maintainer: Supashift Maintainers <maintainers@supashift.dev>

pkgname=supashift-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Manage multiple Supabase CLI profiles with isolated sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/villawebcl/supashift"
license=('MIT')
depends=('glibc')
optdepends=(
  'supabase: run Supabase CLI commands'
  'docker: local supabase start/status'
  'tmux: multi-session workflow'
)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/villawebcl/supashift/releases/download/v${pkgver}/supashift_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/villawebcl/supashift/releases/download/v${pkgver}/supashift_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('279d6f0870973ab718452603ac4bc1653092c64af5df54f879c4acee1addb2cd')
sha256sums_aarch64=('78d8269254a36032e31f1b945543517b097d806431b4db6e0ab18a2ca47bdf3a')

package() {
  install -Dm755 "$srcdir/supashift" "$pkgdir/usr/bin/supashift"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
