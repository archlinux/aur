# Maintainer: Sotirios M. Roussis aka. xtonousou <xtonousou@gmail.com>

pkgname=ship
pkgver=2.6
pkgrel=1
pkgdesc='Simple, handy network addressing multitool with plenty of utilities'
source=('git+https://github.com/xtonousou/shIP.git')
url='https://github.com/xtonousou/shIP.git'
provides=('ship')
conflicts=('ship')
replaces=('ship')
md5sums=('SKIP')
sha256sums=('SKIP')
arch=('any')
license=('GPL3')
depends=('bash>=3.2'
				 'coreutils'
				 'gawk'
				 'grep'
				 'iproute2'
				 'iputils'
				 'mtr'
				 'sed'
				 'traceroute'
				 'wget')
makedepends=('binutils'
						 'coreutils'
					   'git')

pkgver() {
  cd "${srcdir}/${pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"

	echo
	echo "   ▄▄▄▄▄    ▄  █ ▄█ █ ▄▄"
	echo "  █     ▀▄ █   █ ██ █   █"
	echo "▄  ▀▀▀▀▄   ██▀▀█ ██ █▀▀▀"
	echo " ▀▄▄▄▄▀    █   █ ▐█ █"
	echo "              █   ▐  █"
	echo "             ▀        ▀    $(git describe --tags | sed 's/v//g')"
	echo
}

package() {
  cd "${srcdir}/${pkgname}"

  mkdir -p "${pkgdir}/usr/bin"

	install -Dm755 ship.sh "${pkgdir}/usr/bin/ship"
  install -Dm644 -t "${pkgdir}/usr/share/doc/ship/" README.md CHANGELOG.md
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/ship/LICENSE.md"
}

# vim: ts=2 sw=2 et:
