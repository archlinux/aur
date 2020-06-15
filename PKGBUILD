# Maintainer: PastLeo <chgu82837@gmail.com>
pkgname=docker-rootless
pkgver=19.03.11
pkgrel=1
pkgdesc="Run the Docker daemon as a non-root user (Rootless mode)"
arch=('x86_64')
url="https://docs.docker.com/engine/security/rootless/"
license=('Apache')
depends=('docker')
provides=('docker-rootless')
install=docker-rootless.install
source=(
	"https://download.docker.com/linux/static/stable/x86_64/docker-rootless-extras-$pkgver.tgz"
	"docker.service"
)

md5sums=(
	"6be4fdae6e2bd2d4c627fd162226667a"
	"c5158588c36fc80cf85835258f8cd345"
)

sha256sums=(
	"b21ee1469f5b4b3e2a20af5c0f90d7a95c9130b462fbef3808359f2f6767803f"
	"eefe4eaa55184c396f929a2436a22af97130c6e7f8791a79582902dea7c4cd9b"
)

package() {
	mkdir -p "$pkgdir/usr/bin/"
	install -Dm755 "$srcdir/docker-rootless-extras/"* "$pkgdir/usr/bin/"
	install -Dm644 "$srcdir/docker.service" "$pkgdir/usr/lib/systemd/user/docker.service"
}
