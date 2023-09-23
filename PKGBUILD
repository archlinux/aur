# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='fuc-static-musl-bin'
pkgver=1.1.8
pkgrel=1
pkgdesc='Fast Unix Commands: Modern, performance focused unix commands (pre-compiled, statically linked to musl)'
arch=('x86_64')
url='https://github.com/SUPERCILEX/fuc'
license=('Apache')
provides=('cpz' 'fuc' 'rmz')
conflicts=('cpz' 'fuc' 'rmz')
source=(
  "cpz-$pkgver::$url/releases/download/$pkgver/cpz-$CARCH-unknown-linux-musl"
  "rmz-$pkgver::$url/releases/download/$pkgver/rmz-$CARCH-unknown-linux-musl"
)
noextract=(
  "cpz-$pkgver"
  "rmz-$pkgver"
)

package() {
  for _exe in cpz rmz; do
    install -Dm0755 "$_exe-$pkgver" "$pkgdir/usr/bin/$_exe"
  done
}

sha256sums=(
  '2f2276edf9aa7aaad73708efe24c5540868290fa1aba8ecf1a4ec4ebd9409f3d'
  'ea2123a82bbd53e7e389ed448b42b1e1d4af6aa22184f5742f1539ceac1c3f7f'
)
b2sums=(
  '131d9f0b5d0fb690087bcff88c4c2bf3346b787046cd38d3fdc05a2dcfc7029860e5a3b0dd47a4dc738ead71ead531214210bc0daf209d6bf3aa196804e35fc0'
  '3395059eb09c0cb626fbb89b4e8e8a8bd67e5352fee2f04110d23775e96bbea7b7957d29fbb78e647c10b97632546f1ee0a6671df910217e07c7e7e4186956b2'
)

# eof
