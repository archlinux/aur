# Maintainer: rad4ngel <rad4ngel@proton.com>
_pluginname=aitum-multistream
_gitname=obs-${_pluginname}
pkgname=obs-${_pluginname}-bin
pkgver=1.0.9
pkgrel=1
pkgdesc="OBS Studio plugin to multistream by aitum"
arch=('x86_64')
url="https://github.com/Aitum/obs-aitum-multistream"
license=('GPL2')
groups=('obs-aitum-plugins')
depends=('obs-studio>=30.0.0')
provides=("obs-${_pluginname}")
conflicts=("${_gitname}" "obs-plugin-${_pluginname}-git")
source=("${url}/releases/download/${pkgver}/${_pluginname}-linux-gnu.deb")
b2sums=('66607b40d4097676b711755abebb76d2a2cc1d5c5f4a90dac09b2e9bd0a11fed153bfb9e17d21a5d7c140a045c5d0f014b1e83dbf6cebb229dd6eb9025982d2b')
sha512sums=('4ede7e901de263b073ccec585e4a7ab1f4ba2805f4c259b99c62b7a55b69b9adcdc2d76ca9b37798391c49edcd1edd5e9232fd2bbe43680cee47e7cc2f7a106d')
sha256sums=('4386ac9cc4b3f86fb7ecb29c00ef6545d257c3ce5b6c2782d98db13dfddcb4f9') // from github

package() {
    bsdtar -xvf data.tar.gz -C "$srcdir/"

    cd ${srcdir}/

    install -Dm755 ./usr/lib/x86_64-linux-gnu/obs-plugins/${_pluginname}.so ${pkgdir}/usr/lib/obs-modules/plugins/${_pluginname}.so
	install -d ${pkgdir}/usr/share/obs/obs-modules/plugins/${_pluginname}/locale/
    cp -r ./usr/share/obs/obs-plugins/${_pluginname}/* "${pkgdir}/usr/share/obs/obs-modules/plugins/${_pluginname}/"

}
