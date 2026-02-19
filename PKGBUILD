# Maintainer: Zesko
pkgname=journalctl-desktop-notification
pkgver=1.6.1
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
sha256sums=('0bc18013fc2b5056141e12a0812cf3786ceef88be6bb5b60c275df07565d9536')

package() {
	cd "$srcdir/${pkgname}"
	install -dm 755 "usr/share/doc/${pkgname}/"
	cp -r screenshots README.md CHANGELOG.md "usr/share/doc/${pkgname}/"
	cp -r usr etc "$pkgdir"
}
