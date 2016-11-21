# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Roman Kyrylych roman[at]archlinux.org
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=lightscribe
pkgver=1.18.24.1
pkgrel=3
pkgdesc="LightScribe Host Software for Linux"
arch=('i686')
url="http://www.lightscribe.com/downloadsection/linux/index.aspx?id=1372"
license=('custom')
depends=('libstdc++5')
source=(https://dl.dropboxusercontent.com/u/29095940/oss/lightscribe-1.18.24.1-linux-2.6-intel.rpm
		rc.patch)
options=('!strip')

build() {
	cd $srcdir

	rpmextract.sh $pkgname-$pkgver-linux-2.6-intel.rpm 2> /dev/null
	patch -p1 < rc.patch
	rm usr/lib/lightscribe/libstdc++.so.5.0.7
}

package() {
	cd $srcdir

	mv etc usr $pkgdir
	install -D -m644 $pkgdir/usr/share/doc/lightscribeLicense.rtf \
		$pkgdir/usr/share/licenses/lightscribe/license.rtf
}

md5sums=('a0a216278adb64ce06a0c19d603e8a15'
         'cec026845ef45c70b65833167b01ce8f')
sha256sums=('8928a55c5aa0438cde4109c93a30ff2fb8fa62f71855b2df497dd5ef603febf5'
            'e99613a8378a1dc2f66ab99a669bb6d01933a4b1e9f0f9e3ed55b533b34a84a9')
