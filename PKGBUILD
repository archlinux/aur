# Maintainer: Antergos Developers <dev@antergos.com>

_pkgname=web-greeter
pkgname=web-greeter-next
_pkgver=master
pkgver=3.0.0beta4
pkgrel=1
pkgdesc='A modern, visually appealing greeter for LightDM.'
arch=('any')
url="https://github.com/antergos/lightdm-webkit2-greeter"
license=('GPL3')
depends=('lightdm' 'python-whither' 'python-gobject' 'accountsservice' 'antergos-wallpapers')
optdepends=('at-spi2-core: a11y support')
makedepends=('zip')
provides=('lightdm-greeter' 'lightdm-webkit2-greeter')
replaces=('lightdm-webkit2-greeter-next')
backup=("etc/lightdm/${_pkgname}.yml")
source=("http://github.com/Antergos/${_pkgname}/archive/${_pkgver}.zip")
sha512sums=('751bf4a61e3c27cbe4149627d7e4032dd8425e9b9448559424bbfff5b9c190a14ebaa3e711c737948e38fdcd863a0fa8b3fe91ee9734f4cc0a7ac6d8ae7d21ae')
groups=('system')


package() {
	cd "${srcdir}/${_pkgname}-${_pkgver}"

	make -j1 \
		DESTDIR="${pkgdir}" \
		background_images_dir=/usr/share/antergos/wallpapers \
		install
}

# -*- mode: bash;-*-

