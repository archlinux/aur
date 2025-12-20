# Maintainer: Rad.4ngel <radangelzero@gmail.com>
_pluginname=aitum-multistream
_gitname=obs-${_pluginname}
pkgname=obs-${_pluginname}-bin
pkgver=1.0.7
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
b2sums=('acb559d1f341ce0ee80652b77e8c57b3ebc72b3284020b90cc2207c5fed44dc2c6aeb875147a0af818dc7f4deb711ee0a2e1a22ba1d330ab17f02457074ed646')
sha512sums=('e3648112d207f9a422fd9acd19ba574af75b23c348137ef17c39f4c96ecbff45f8424b95360577721180e8cf2992b4356d589e2b1c3f438fb5a4827f472f3d93')

package() {
    bsdtar -xvf data.tar.gz -C "$srcdir/"

    cd ${srcdir}/

    install -d ${pkgdir}/usr/lib/obs-plugins/
	install -d ${pkgdir}/usr/share/obs/obs-plugins/${_pluginname}/locale/

	install -Dm755 ./usr/lib/x86_64-linux-gnu/obs-plugins/${_pluginname}.so ${pkgdir}/usr/lib/obs-plugins/
	install -Dm755 ./usr/share/obs/obs-plugins/${_pluginname}/locale/* ${pkgdir}/usr/share/obs/obs-plugins/${_pluginname}/locale/
}
