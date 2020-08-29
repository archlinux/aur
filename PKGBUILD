# Maintainer: PastLeo <chgu82837@gmail.com>
pkgname=docker-rootless-bin
pkgver=19.03.12
pkgrel=1
pkgdesc="Run the Docker daemon as a non-root user (Rootless mode)"
arch=('x86_64')
url="https://docs.docker.com/engine/security/rootless/"
license=('Apache')
depends=('docker')
provides=('docker-rootless')
conflicts=('docker-rootless')
install=docker-rootless.install
source=(
	"https://download.docker.com/linux/static/stable/x86_64/docker-rootless-extras-$pkgver.tgz"
	"docker.service"
)

md5sums=(
	"90add09c07b8c2291b93e3fd6c3da0ed"
	"04425cca4e95bf534c41697aeabfcad4"
)

sha256sums=(
	"7b66da2c8ba6c0b04bfb054327f229ac82aa98c827b747693822f45ffd01e5de"
	"edf633c42d27e039d5acbb1ead685d6acd66b06786a8552e1bbe5f789dc2c315"
)

package() {
	mkdir -p "$pkgdir/usr/bin/"
	install -Dm755 "$srcdir/docker-rootless-extras/"* "$pkgdir/usr/bin/"
	install -Dm644 "$srcdir/docker.service" "$pkgdir/usr/lib/systemd/user/docker.service"
}
