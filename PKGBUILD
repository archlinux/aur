# Maintainer: Rad.4ngel <radangelzero@gmail.com>
_pluginname=aitum-multistream
_gitname=obs-${_pluginname}
pkgname=obs-${_pluginname}-bin
pkgver=1.0.8
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
b2sums=('8041d759d7fac3e5530b27de3054949e6e71ebee673601a1414eb3bd4888304b7edd68c2a114a63add614e46b1f8b0357b44d782e0e8a36351787d41c45004e9')
sha512sums=('38fab6b7d6f7bb05e6c9d86acbb6584fe34dd9affba8c5744987d39d93ff9862638f67919e8fb6180f2ce0be655ae2018a9b0b500c93a338b2b460b334f87c0a')

package() {
    bsdtar -xvf data.tar.gz -C "$srcdir/"

    cd ${srcdir}/

    install -d ${pkgdir}/usr/lib/obs-plugins/
	install -d ${pkgdir}/usr/share/obs/obs-plugins/${_pluginname}/locale/

	install -Dm755 ./usr/lib/x86_64-linux-gnu/obs-plugins/${_pluginname}.so ${pkgdir}/usr/lib/obs-plugins/
	install -Dm755 ./usr/share/obs/obs-plugins/${_pluginname}/locale/* ${pkgdir}/usr/share/obs/obs-plugins/${_pluginname}/locale/
}
