# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=memdoor-bin
pkgver=1.810.0
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
            '182b73e682f24ade914f975bf86bae425d780dc827b3d2c064cb24e076f432d4'
            'e28cb15ddc5e7d9c02d9a4e40db054eaed650d1162dcbbbd4cf7ea126d12ea6a')
sha256sums_x86_64=('faac304a67dc8e2ff356f268f951ddff8fc39985e2cc71e95cb1c459d473abc8')
sha256sums_aarch64=('1d6414965e0ce7356a0623b161975e586f64460ee73cff9c3635644d1e5c7af3')

package() {
  install -Dm755 "$srcdir/memdoor-$pkgver-linux-$CARCH" "$pkgdir/usr/bin/memdoor"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/NOTICE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
  install -Dm644 "$srcdir/GETTING_STARTED-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/GETTING_STARTED.md"
}
