# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='fuc-bin'
pkgver=1.1.9
pkgrel=1
pkgdesc='Fast Unix Commands: Modern, performance focused unix commands (pre-compiled)'
arch=('aarch64' 'x86_64')
url='https://github.com/SUPERCILEX/fuc'
license=('Apache')
provides=('cpz' 'fuc' 'rmz')
conflicts=('cpz' 'fuc' 'rmz' 'fuc-static-musl-bin')
replaces=('fuc-static-musl-bin')
source_aarch64=(
  "cpz-aarch64-$pkgver::$url/releases/download/$pkgver/cpz-aarch64-unknown-linux-gnu"
  "rmz-aarch64-$pkgver::$url/releases/download/$pkgver/rmz-aarch64-unknown-linux-gnu"
)
source_x86_64=(
  "cpz-x86_64-$pkgver::$url/releases/download/$pkgver/cpz-x86_64-unknown-linux-gnu"
  "rmz-x86_64-$pkgver::$url/releases/download/$pkgver/rmz-x86_64-unknown-linux-gnu"
)
noextract=(
  "cpz-$CARCH-$pkgver"
  "rmz-$CARCH-$pkgver"
)
depends=('gcc-libs' 'glibc')

package() {
  for _exe in cpz rmz; do
    install -Dm0755 "$_exe-$CARCH-$pkgver" "$pkgdir/usr/bin/$_exe"
  done
}

sha256sums_aarch64=(
  'c0959b9bfc4f1bdf597cf36c3699877c388ae68bf620f99ed91d68fb7e2844a1'
  '768f21f68d1d62f7452e7f95d3a6f01afe1791f4d80b8348ae00e86267281acd'
)
sha256sums_x86_64=(
  '8b9695b3287f86e664b704bfe907c48736cc886d4c093fc78a7be0f66b085219'
  '7143dc245b2835f16434fc1951616849fc700ee3c1079b20fcd01e9440c1357c'
)

# eof
