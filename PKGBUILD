
# Maintainer: Noel Kuntze <noel@familie-kuntze.de>
pkgname=docker-makepkg
pkgver=1.0
pkgrel=1
pkgdesc="A script and docker image to build packages in a clean container"
arch=(any)
url=""
license=('MIT')
depends=(docker)
source=("https://github.com/Thermi/docker-makepkg/archive/${pkgver}.tar.gz"
		"https://github.com/Thermi/docker-makepkg/releases/download/${pkgver}/${pkgver}.tar.gz.asc"
)
sha256sums=('3cd1b3352f1c49796f7a32d1b7d18f3267d82c9ab0e51deeb6c1a0734b1a5a96'
            'SKIP')
validpgpkeys=(92C65A2073E1D8A4D0985B7B509B7C4EBF451EDC)

package() {
	cd "$pkgdir"
	mkdir -p "$pkgdir/opt/docker-makepkg" "$pkgdir/usr/lib/systemd/system"
	cp "$srcdir/$pkgname-$pkgver"/{Dockerfile,buildme.sh,dmakepkg,run.sh,sudoers} "$pkgdir/opt/docker-makepkg"
	cp "$srcdir/$pkgname-$pkgver"/docker-makepkg.{service,timer} "$pkgdir/usr/lib/systemd/system/"
}
