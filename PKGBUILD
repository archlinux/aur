# Maintainer: Thomas Maier <contact@thomas-maier.net>
pkgname=alfaview
pkgver=8.3.1
pkgrel=1
pkgdesc='High quality audio video conferencing for professional online meetings and live classes'
arch=('x86_64')
url='https://alfaview.com/'
license=('unknown')
# not sure about the deps, copy-pasted from debian package (feedback required)
depends=('ttf-roboto' 'libsecret' 'xdg-utils' 'freetype2' 'fontconfig' 'gst-plugins-bad' 'libxfixes' 'alsa-lib' 'libxkbcommon' 'dbus')
options=('!strip')
install="$pkgname.install"
source=("https://production-alfaview-assets.alfaview.com/stable/linux/${pkgname}_${pkgver}.deb")
noextract=("${pkgname}_${pkgver}.deb")
sha256sums=('5a335c63727713991a998c9519c1c6c671f6a90287e025f97edc7c7a93eb2fd2')

package() {
    bsdtar -O -xf "${pkgname}_${pkgver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
	mkdir -p "${pkgdir}/usr/bin"
	ln -sf /opt/alfaview/alfaview "${pkgdir}/usr/bin/alfaview"
}
