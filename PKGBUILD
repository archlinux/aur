# Maintainer: David Raznick <david.raznick@globalenergymonitor.org>
#
# Prebuilt-binary package, repackaging the GitHub release artifacts.
# After each release: bump pkgver, reset pkgrel, run `updpkgsums`.
pkgname=sqlnow-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Local SQL viewer for files and databases, with pre-defined queries for LLM-agent workflows"
arch=('x86_64' 'aarch64')
url="https://github.com/kindly/sqlnow"
license=('MIT')
provides=('sqlnow')
conflicts=('sqlnow')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/sqlnow-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/sqlnow-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('94b719b23cf87ee7e25b89e2ba9391663fb20f5cc39355ee45c00f693e977fe7')
sha256sums_aarch64=('30e9a7fda199ac2db57b700fc2f0526ef70398661f4d0d88875219e91cb72945')

package() {
    install -Dm755 sqlnow "$pkgdir/usr/bin/sqlnow"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/sqlnow/README.md"
    install -Dm644 AGENTS.md "$pkgdir/usr/share/doc/sqlnow/AGENTS.md"
}
