# Maintainer: Frederic Van Assche <frederic@fredericva.com>

pkgname=sigasi
pkgver=2.31
pkgrel=1
pkgdesc='IDE for VHDL editing and browsing'
arch=('i686' 'x86_64')
url='http://www.sigasi.com/'
license=('custom')
source_x86_64=("http://download.sigasi.com/updates/sigasi-hdt2/com.sigasi.hdt.product-linux.gtk.x86_64.zip")
source_i686=("http://download.sigasi.com/updates/sigasi-hdt2/com.sigasi.hdt.product-linux.gtk.x86.zip")
source=('sigasi.desktop')
depends=('glib2')
sha256sums=('a8084b3146904c2accd5946e2aa493e133c56e4f8f0d7f582a0edcb080a7958c')
sha256sums_i686=('a087031a5f526018e9414bb997a14fb711d79a2ee3cdf71156023554b8b970c6')
sha256sums_x86_64=('3f13fe8d69c2966368672a056894c04e95366ddc972ec2c7a3a9936b35e3fe7c')

package() {
	cd "${srcdir}/"

	install -d -m755 "${pkgdir}/opt/"
	install -d -m755 "${pkgdir}/usr/share/applications/"
	install -d -m755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
	install -d -m755 "${pkgdir}/usr/bin/"
	cp -a sigasi "${pkgdir}/opt/"

	unzip -qjo "sigasi/plugins/com.sigasi.hdt.product.plugin_${pkgver}*.jar" icons/si128.png
	install -m644 si128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/sigasi.png"
	install -m644 "${srcdir}/sigasi.desktop" "${pkgdir}/usr/share/applications/"

	install -D -m644 sigasi/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

	rm -rf "${pkgdir}/opt/sigasi/jre"

	cd "${pkgdir}/usr/bin/"
	ln -s ../../opt/sigasi/sigasi sigasi
}
sha256sums=('a8084b3146904c2accd5946e2aa493e133c56e4f8f0d7f582a0edcb080a7958c')
sha256sums_i686=('a087031a5f526018e9414bb997a14fb711d79a2ee3cdf71156023554b8b970c6')
sha256sums_x86_64=('3f13fe8d69c2966368672a056894c04e95366ddc972ec2c7a3a9936b35e3fe7c')
sha256sums=('a8084b3146904c2accd5946e2aa493e133c56e4f8f0d7f582a0edcb080a7958c')
sha256sums_i686=('64144deb3493fd6722fa98c30f6c6e21235de69411cd6bcc4cc3a2ad40168618')
sha256sums_x86_64=('9a69d85f70e42fe39120ed40b561ac8db895a3b31c283d249ded29c03f963215')
