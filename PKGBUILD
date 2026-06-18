# Maintainer: kobe-koto <k [at] koto [dot] cc>
pkgname=preaur-bin
pkgver=0.0.4
pkgrel=1
pkgdesc="PreAUR, build AUR (not only) pkgbuilds ahead of time. (prebuilt binary)"
arch=('x86_64')
url="https://github.com/kobe-koto/preaur"
license=('MIT')
depends=(
  'bun'
  'git'
  'devtools'
  'base-devel'
)
provides=('preaur')
conflicts=('preaur')
source=(
  "preaur-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/preaur-v${pkgver}.tar.gz"
)
sha256sums=('SKIP')

package() {
  local release_dir="$srcdir/preaur-v${pkgver}"

  install -Dm755 "$release_dir/preaur" "$pkgdir/usr/bin/preaur"
  install -Dm644 "$release_dir/preaur.schema.json" "$pkgdir/usr/share/preaur/preaur.schema.json"
  install -Dm644 "$release_dir/docs/config-reference.md" "$pkgdir/usr/share/doc/$pkgname/config-reference.md"
  install -Dm644 "$release_dir/docs/man/preaur.1" "$pkgdir/usr/share/man/man1/preaur.1"
  install -Dm644 "$release_dir/docs/man/preaur-config.5" "$pkgdir/usr/share/man/man5/preaur-config.5"
  install -Dm644 "$release_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
