# Maintainer: Zesko
pkgname=systemd-timer-notify
pkgver=1.5.0
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
sha256sums=('caddb676971b795d117e31ffaf59f31c59b71966e0d39f3bee263c5c513c6b78')

package() {
	cd "$srcdir/${pkgname}"
	install -dm 755 "usr/share/doc/${pkgname}/"
	cp -r screenshots README.md CHANGELOG.md "usr/share/doc/${pkgname}/"
	cp -r usr etc "$pkgdir"
}
