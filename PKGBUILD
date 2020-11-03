# Maintainer:  Donato Junior <donato.jun gmail com>
# Contributor: Rafael Vega <contacto rafaelvega co>
# Contributor: Karsten Elfenbein <karsten.elfenbein gmail com>
# Contributor: Dainius Sakalinskas <dinuxlt gmail com>

pkgname=iscan-plugin-perfection-v550
pkgver=1.0.1
pkgrel=1
_pluginrel=1
_bundlever=2.30.4
pkgdesc="iscan plugin for Epson Perfection v550 Photo"
arch=('x86_64')
url="http://support.epson.net/linux/en/iscan.php?model=perfection-v550"
license=('custom')
depends=('iscan')
makedepends=('rpmextract')
install=perfection-v550.install

md5sums=('f0ea0be6d99385ebfd278a923b71ecd9')
source=(https://download2.ebz.epson.net/iscan/plugin/perfection-v550/rpm/x64/iscan-perfection-v550-bundle-${_bundlever}.x64.rpm.tar.gz)

package() {
        cd ${srcdir}/iscan-perfection-v550-bundle-${_bundlever}.x64.rpm/plugins
        rpmextract.sh ${pkgname}-${pkgver}-${_pluginrel}.x86_64.rpm
        mv usr $pkgdir
        mv $pkgdir/usr/lib{64,}

        install -m 644 -D ${pkgdir}/usr/share/doc/${pkgname}-${pkgver//_*/}/COPYING.EPSON.en.txt ${pkgdir}/usr/share/licenses/${pkgname}/COPYING.EPSON.en.txt
        install -m 644 -D ${pkgdir}/usr/share/doc/${pkgname}-${pkgver//_*/}/COPYING.EPSON.ja.txt ${pkgdir}/usr/share/licenses/${pkgname}/COPYING.EPSON.ja.txt
}
