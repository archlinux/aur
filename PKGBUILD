# Maintainer: Harshith Mohan <gharshitmohan@ymail.com>
pkgname=bixby-studio
pkgver=8.0.1_r20i.17221
pkgrel=1
pkgdesc="Bixby Developer Studio"
arch=('x86_64')
url="https://bixbydevelopers.com/"
license=('commercial')
depends=('at-spi2-core' 'gtk3' 'libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'xdg-utils')
options=('!strip' '!emptydirs')
source_x86_64=("https://bixby-ide.s3.amazonaws.com/stable-c4f5c975-1d91-4065-b661-633de7275e11/BixbyStudio-${pkgver//_/-}-linux.deb")
md5sums_x86_64=('2e6a8c03731a1196f7148487b4f493ec')

package(){
	tar xf data.tar.xz -C "${pkgdir}"
	install -dm755 "${pkgdir}/usr/bin"
	ln -sf "/opt/Bixby Studio/bixbystudio" "${pkgdir}/usr/bin/bixby-studio"
	install -D -m644 "${pkgdir}/opt/Bixby Studio/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
