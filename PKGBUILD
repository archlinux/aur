# Maintainer: Cristian Villalobos <cristianvillalobosvv@gmail.com>

pkgname=supashift-bin
pkgver=0.1.2
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
sha256sums_x86_64=('49fb6f0d190ba58961d5e477ba514e4fff9b02294a1388e1b736da77a39ca931')
sha256sums_aarch64=('8c8fcbb07e56d09ad73b5bc1a2dea5c5c00ed4c554bbd0bfe0abe057e706fe5f')

package() {
  install -Dm755 "$srcdir/supashift" "$pkgdir/usr/bin/supashift"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
