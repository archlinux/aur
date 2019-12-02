# Maintainer: PastLeo <chgu82837@gmail.com>
pkgname=docker-rootless
pkgver=1
pkgrel=1
pkgdesc="Run the Docker daemon as a non-root user (Rootless mode)"
arch=('x86_64')
url="https://docs.docker.com/engine/security/rootless/"
license=('Apache')
depends=('docker')
provides=('docker-rootless')
install=docker-rootless.install
source=(
	"https://master.dockerproject.org/linux/x86_64/docker-rootless-extras.tgz"
	"docker.service"
)
md5sums=(
	"943e113aedab4ee159977d9d16f7e712"
	"30a7a07f461b6c9f2f068a9505ba79bc"
)

package() {
	mkdir -p "$pkgdir/usr/bin/"
	install -Dm755 "$srcdir/docker-rootless-extras/"* "$pkgdir/usr/bin/"
	install -Dm644 "$srcdir/docker.service" "$pkgdir/usr/lib/systemd/user/docker.service"
}
