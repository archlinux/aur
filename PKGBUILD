# Maintainer: Zesko
pkgname=systemd-timer-notify
pkgver=1.5.1
pkgrel=2
pkgdesc="Notifies when systemd timers start services; auto-closes on finish."
arch=('any')
url="https://gitlab.com/Zesko/systemd-timer-notify"
license=('GPL3')
depends=('python' 'libnotify' 'systemd' 'openssh')
optdepends=('dunst')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
backup=("etc/${pkgname}.conf")
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('3668b9ff1bd8e04427f21e855408320ecbe457fe57f84b25003aaf5fa4093cb5')

package() {
	cd "$srcdir/${pkgname}"
	install -dm 755 "usr/share/doc/${pkgname}/"
	cp -r screenshots README.md CHANGELOG.md "usr/share/doc/${pkgname}/"
	cp -r usr etc "$pkgdir"
}
