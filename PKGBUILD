# Maintainer: Dustin Falgout <dustin@antergos.info>

pkgname=lightdm-webkit-theme-userdock
_pkgname=userdock
pkgver=1.0.2
pkgrel=2
pkgdesc="User Dock theme for the LightDM Webkit Greeter"
arch=('any')
url="http://www.antergos.com"
license=('GPLv2')
depends=('lightdm-webkit2-greeter')
install=theme.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lots0logs/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('b958fabf99ebdf023d9accff35341ac0')

build()
{
	cd ${srcdir}/${pkgname}-${pkgver}
}

package()
{
	cd ${pkgdir}
	mkdir -p usr/share/lightdm-webkit/themes
	cd usr/share/lightdm-webkit/themes
	cp -dpr --no-preserve=ownership ${srcdir}/${pkgname}-${pkgver} ${_pkgname}
	msg "Removing .git files"
	cd ${_pkgname}
	rm -rf .gitignore
}
