# Contributor: Asuka Minato
pkgname=sshx-bin
pkgver=0.2.0 # upstream don't put version in their address.
pkgrel=1
pkgdesc="Fast, collaborative live terminal sharing over the web"
arch=(x86_64 aarch64)
url="https://sshx.io/"
license=('MIT')
depends=()
source=(https://raw.githubusercontent.com/ekzhang/sshx/bd81c86d52f35c6056cf8c2bf560e71573290244/LICENSE)
source_x86_64=("https://s3.amazonaws.com/sshx/sshx-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://s3.amazonaws.com/sshx/sshx-aarch64-unknown-linux-musl.tar.gz")

sha256sums=('f58ef45c2bfade6a011c6b62f3805ea8bc0d604fdfac1a0b72a94f0d844123b6')
sha256sums_x86_64=('e1e52870b768489aad417808017b52a5470b14e166d60ced4e853737127d3282')
sha256sums_aarch64=('923d7205d4ca365eee9a89c2fbe5b9ea8ce5bbf096fc133795158d3256fc3b27')

package() {
	find . -name "sshx" -exec install -Dm755 {} -t $pkgdir/usr/bin \;
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
