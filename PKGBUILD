# Maintainer: Zesko
pkgname=journalctl-desktop-notification
pkgver=2.0.0
pkgrel=1
pkgdesc="Displays notifications for journalctl error messages."
arch=('any')
url="https://gitlab.com/Zesko/journalctl-desktop-notification"
license=('GPL3')
depends=('libnotify' 'systemd')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
backup=("etc/${pkgname}.conf")
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('a9f19bb1d70f9be054976db4717291a568b835a51087101f2b849f82d7f30b38')

package() {
	cd "$srcdir/${pkgname}"
	install -dm 755 "$pkgdir/usr/share/doc/${pkgname}/"
	install -Dm 644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/${pkgname}/"
	cp -a usr etc "$pkgdir"
}
