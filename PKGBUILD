# Maintainer: LIghtJUNction (https://github.com/LIghtJUNction)
# Prebuilt official release; intentionally no Cargo/build() step.
pkgname=ssmcp-bin
pkgver=0.10.31
pkgrel=1
pkgdesc='Authenticated native tools and terminal access over MCP (official prebuilt binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/ssmcp'
license=('MIT')
depends=('libgcc_s.so' 'glibc' 'nodejs' 'bubblewrap' 'util-linux' 'git')
optdepends=('rsync: workspace directory synchronization')
provides=("ssmcp=$pkgver")
conflicts=('ssmcp' 'ssmcp-git')
options=('!strip' '!debug')
source_x86_64=("ssmcp-${pkgver}-x86_64.tar.gz::$url/releases/download/v$pkgver/ssmcp-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("ssmcp-${pkgver}-aarch64.tar.gz::$url/releases/download/v$pkgver/ssmcp-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('7320249b42fbcda02f1b3f8188f2ee226ae2ecf793bf662f561e0c36cec0a5ab')
sha256sums_aarch64=('b022546ff5f62af6a893961f79ff0a142aa3d50d7e3f3f02ce5a70bfb8a7144a')

package() {
  install -Dm755 ssmcp "$pkgdir/usr/bin/ssmcp"
  install -Dm755 ssmcpd "$pkgdir/usr/bin/ssmcpd"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 packaging/man/ssmcp.1 "$pkgdir/usr/share/man/man1/ssmcp.1"
  install -Dm644 packaging/man/ssmcpd.8 "$pkgdir/usr/share/man/man8/ssmcpd.8"
  install -Dm644 README.md "$pkgdir/usr/share/doc/ssmcp/README.md"
}
