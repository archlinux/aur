# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=memdoor-bin
pkgver=1.769.0
pkgrel=1
pkgdesc='Coding and automation agent in a single CLI binary (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/guregodevo/memdoor'
license=('Apache-2.0')
depends=('bash' 'ca-certificates')
optdepends=('git: Git workspaces and worktrees'
            'openssh: remote gateways over SSH'
            'xdg-utils: open browser authentication links')
provides=("memdoor=$pkgver")
conflicts=('memdoor')
options=(!strip !debug)
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/guregodevo/memdoor/v$pkgver/LICENSE"
        "NOTICE-$pkgver::https://raw.githubusercontent.com/guregodevo/memdoor/v$pkgver/NOTICE"
        "GETTING_STARTED-$pkgver.md::https://raw.githubusercontent.com/guregodevo/memdoor/v$pkgver/GETTING_STARTED.md")
source_x86_64=("memdoor-$pkgver-linux-x86_64::$url/releases/download/v$pkgver/memdoor-linux-amd64")
source_aarch64=("memdoor-$pkgver-linux-aarch64::$url/releases/download/v$pkgver/memdoor-linux-arm64")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            'f09a06aa6e7d3cd22d83a34f99246d11edfe33ee3800742ac9b79ab1d32c0746'
            'e92b3ac5a879351d118acff96a823450e31824f1b5e54d90739aec2dedc63e2f')
sha256sums_x86_64=('5387889ed40298ca4b9f7bccb6c020d9ca31c640598ceafa5a5f90bdb3d802ab')
sha256sums_aarch64=('700a4572249d691139b55a639540415e4419ddc336f96e9554fe4b05729ddaff')

package() {
  install -Dm755 "$srcdir/memdoor-$pkgver-linux-$CARCH" "$pkgdir/usr/bin/memdoor"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/NOTICE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
  install -Dm644 "$srcdir/GETTING_STARTED-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/GETTING_STARTED.md"
}
