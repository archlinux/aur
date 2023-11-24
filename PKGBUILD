# Maintainer: ravi0li <mail+aur at moritz dot pw>
pkgname=pomatez
pkgver=1.6.1
pkgrel=1
pkgdesc="Stay Focused. Take a Break."
arch=('x86_64')
url="https://zidoro.github.io/pomatez/"
license=('MIT')
makedepends=('tar')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
source=("https://github.com/zidoro/pomatez/releases/download/v${pkgver}/Pomatez-v${pkgver}-linux-amd64.deb")
sha512sums=('dc363d3b231f9660e9663d85fcf420b896ba7722b7a4861c4dfec0ffb176d63d6bc48224e551ff422208ce4a620676ab3e3750c0096fbb32d3f446c65b7c6943')

package() {
	cd "${pkgdir}"
	mkdir -p usr/bin
	ln -s /opt/Pomatez/pomatez usr/bin/pomatez
	# extracts everything into the pkgdir
	tar xf "${srcdir}/data.tar.xz"
}
