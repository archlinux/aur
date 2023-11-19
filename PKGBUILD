# Maintainer: ravi0li <mail+aur at moritz dot pw>
pkgname=pomatez
pkgver=1.5.0
pkgrel=1
pkgdesc="Stay Focused. Take a Break."
arch=('x86_64')
url="https://zidoro.github.io/pomatez/"
license=('MIT')
makedepends=('tar')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
source=("https://github.com/zidoro/pomatez/releases/download/v${pkgver}/Pomatez-v${pkgver}-linux-amd64.deb")
sha512sums=('e5350af4b0bd1ab43b6262dcc58be6c629d3289d3a48d33237883fc485788625fba98409826e36dbab59f897dd4a659024cb1073fd81f89c0eeb8f7d57a9eaa0')

package() {
	cd "${pkgdir}"
	mkdir -p usr/bin
	ln -s /opt/Pomatez/pomatez usr/bin/pomatez
	# extracts everything into the pkgdir
	tar xf "${srcdir}/data.tar.xz"
}
