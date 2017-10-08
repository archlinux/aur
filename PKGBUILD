# Maintainer: Antergos Developers <dev@antergos.com>

_pkgname=web-greeter
pkgname=web-greeter-next
_pkgver=master
pkgver=3.0.0beta6
epoch=1
pkgrel=1
pkgdesc='A modern, visually appealing greeter for LightDM.'
arch=('any')
url="https://github.com/antergos/web-greeter"
license=('GPL3')
depends=('lightdm' 'python-whither' 'python-gobject' 'accountsservice' 'antergos-wallpapers')
optdepends=('at-spi2-core: a11y support')
makedepends=('zip')
provides=('lightdm-greeter' 'lightdm-webkit2-greeter')
replaces=('lightdm-webkit2-greeter-next')
backup=("etc/lightdm/${_pkgname}.yml")
source=("http://github.com/Antergos/${_pkgname}/archive/${_pkgver}.zip")
sha512sums=('5fddd0b725a2476d80ca608d5a7c85bea5716dce11783071c71fceb9beb197db6bf7aec9d06a458267ca683b83de71f44d9f71697e489c7ce4de52e9d3e0dc27')
groups=('system')


package() {
	cd "${srcdir}/${_pkgname}-${_pkgver}"

	make -j1 \
		DESTDIR="${pkgdir}" \
		background_images_dir=/usr/share/antergos/wallpapers \
		install
}

# -*- mode: bash;-*-

