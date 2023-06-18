# Maintainer: Erik Dubois <erikdubois@gmail.com>
pkgname=gitfiend
_pkgname=GitFiend
pkgver=0.42.0
pkgrel=1
pkgdesc='A Git client designed for humans'
arch=('x86_64')
license=('ISC')
depends=('libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-atk' 'libappindicator-gtk3' 'libsecret')
url="https://gitfiend.com"
options=('!strip')
source=("https://gitfiend.com/resources/${_pkgname}_${pkgver}_amd64.deb")
md5sums=('bde2c4f24fb25e8e40ce0e1c288c85d7')
package() {
	tar -xvf data.tar.xz -C ${pkgdir}
	chmod 4755 ${pkgdir}/opt/GitFiend/chrome-sandbox
	install -dm755 "$pkgdir/usr/bin"
	ln -sf "/opt/GitFiend/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
