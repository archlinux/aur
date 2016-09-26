# Maintainer: Callum Mance <callummance@gmail.com>
pkgname=cf-update-git
pkgver=v0.1.r2.g9f963c8
pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
epoch=
pkgdesc="Updater for Cloudflare DNS records"
arch=('any')
url="https://github.com/callummance/CF-Update"
license=('GPL3')
groups=()
depends=('python')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/cf-update/cf.conf')
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/callummance/CF-Update.git")
noextract=()
validpgpkeys=()

package() {
	cd "$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/etc/cf-update"
	install -m 755 -t "${pkgdir}/usr/bin/" ./cf-update
	install -m 644 -t "${pkgdir}/etc/cf-update/" ./cf.conf
}
sha256sums=('SKIP')
sha512sums=('SKIP')
sha1sums=('SKIP')
md5sums=('SKIP')
