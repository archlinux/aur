# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='fuc-bin'
pkgver=1.1.8
pkgrel=1
pkgdesc='Fast Unix Commands: Modern, performance focused unix commands (pre-compiled)'
arch=('aarch64' 'x86_64')
url='https://github.com/SUPERCILEX/fuc'
license=('Apache')
provides=('cpz' 'fuc' 'rmz')
conflicts=('cpz' 'fuc' 'rmz')
replaces=('fuc-static-musl-bin')
source_aarch64=(
  "cpz-aarch64-$pkgver::$url/releases/download/$pkgver/cpz-$CARCH-unknown-linux-gnu"
  "rmz-aarch64-$pkgver::$url/releases/download/$pkgver/rmz-$CARCH-unknown-linux-gnu"
)
source_x86_64=(
  "cpz-x86_64-$pkgver::$url/releases/download/$pkgver/cpz-$CARCH-unknown-linux-gnu"
  "rmz-x86_64-$pkgver::$url/releases/download/$pkgver/rmz-$CARCH-unknown-linux-gnu"
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
  'db02560fe0cda9fb04984ba6db00a77acaa1d4f1ff5e962b4ede0e94898127f0'
  '500a8c3d4375b6308ebfdee4b2935b6e3b141d306f1b4bb62ac281d475212f38'
)

sha256sums_x86_64=(
  'f6e2a68071a91660f028854e2e20bd6d514cbe289544d691d04a349c3abf7d3b'
  '06ef67864214f9b11dc8e68cf98ae1a2768bc8070e4d06e771595ab6c50e7dfe'
)

# eof
