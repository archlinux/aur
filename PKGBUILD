# Maintainer: zhullyb <zhullyb@outlook.com>
pkgname=deepin.com.qq.im.light
pkgver=7.9.14308deepin8
pkgrel=4
epoch=
pkgdesc="Deepin Wine QQ Light 7.9."
arch=('i686' 'x86_64')
url="http://im.qq.com/"
license=('Proprietary')
groups=()
depends=('deepin-wine5' 'p7zip')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=.INSTALL
changelog=
source=("https://packages.deepin.com/deepin/pool/non-free/d/${pkgname}/${pkgname}_${pkgver}_i386.deb"
  "run.sh")
noextract=("${pkgname}_${pkgver}_i386.deb")
md5sums=('a2472c420ee9037f530afc24d2e594ea'
  "6999edb941d7e04a73e1582ec3b0f828")
validpgpkeys=()

prepare() {
	ar -x ${pkgname}_${pkgver}_i386.deb
	mkdir ${pkgname}-${pkgver}
	tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"
	cp run.sh ${pkgname}-${pkgver}/opt/deepinwine/apps/Deepin-QQLight/
}

package() {
	cd "${pkgname}-${pkgver}"
	cp -r ./ ${pkgdir}/
	mv ${pkgdir}/usr/local/share ${pkgdir}/usr/share
}
