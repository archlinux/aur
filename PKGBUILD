# Maintainer: Antergos Developers <dev@antergos.com>

_pkgname=web-greeter
pkgname=web-greeter-next
_pkgver=master
pkgver=3.0.0rc1
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
sha512sums=('744f7f5de54081f90a04bccdf3d848d4f41b974eb45b4ed72a50ca2067e7009dc1f21b3bed7597aeed9dc2cd5cb18be503cb40fd33935534869c8f562178fce6')
groups=('system')


package() {
	cd "${srcdir}/${_pkgname}-${_pkgver}"

	make -j1 \
		DESTDIR="${pkgdir}" \
		background_images_dir=/usr/share/antergos/wallpapers \
		install
}

# -*- mode: bash;-*-

