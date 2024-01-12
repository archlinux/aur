# Maintainer: jasmineteax <jastxakajasmineteax at gmail dot com>
_pkgauthor="HorizonFFXI"
_pkgname="horizonxi-launcher"
pkgname="${_pkgname}-bin"
pkgver="1.2.4"
pkgrel=1
pkgdesc="Launcher for the popular Final Fantasy XI private server HorizonXI"
arch=('x86_64')
url="https://horizonxi.com"
license=('custom')
groups=()
depends=('alsa-lib' 'gcc-libs' 'dbus' 'pango' 'gtk3' 'glibc' 'nss' 'libxcomposite'
		 'libx11' 'libxrandr' 'cairo' 'libxcb' 'libxext' 'libxfixes' 'libxdamage' 
		 'libcups' 'expat' 'glib2' 'libxkbcommon' 'libdrm' 'nspr' 'mesa' 'wayland' 'at-spi2-core') 
optdepends=('apparmor' 'gnome-keyring' 'libgnome-keyring' 'kde-cli-tools' 'discord' 'pulseaudio')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://github.com/${_pkgauthor}/HorizonXI-Launcher-Binaries/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha512sums=('155a3c6ee4c5a837cf9e0431e942e51dbca2381685f1d7dcbf763196dc229b44702089679d9909db39aaee0ef9b59f4b07537ec633d3103f010dcae0b93a5e16')

declare -gA _system_libs=(
	libffmpeg.so=libffmpeg.so-64
	libdl.so=2-64
	libpthread.so=0-64
	libgobject-2.0.so=0-64
	libglib-2.0.so=0-64
	libgio-2.0.so=0-64
	libnss3.so=libnss3.so-64
	libnssutil3.so=libnssutil3.so-64
	libsmime3.so=libsmime3.so-64
	libnspr4.so=libnspr4.so-64
	libatk-1.0.so=0-64
	libatk-bridge-2.0.so=0-64
	libcups.so=2-64
	libdbus-1.so=3-64
	libdrm.so=2-64
	libgtk-3.so=0-64
	libpango-1.0.so=0-64
	libcairo.so=2-64
	libm.so=6-64
	libX11.so=6-64
	libXcomposite.so=1-64
	libXdamage.so=1-64
	libXext.so=6-64
	libXfixes.so=3-64
	libXrandr.so=2-64
	libgbm.so=1-64
	libexpat.so=1-64
	libxcb.so=1-64
	libxkbcommon.so=0-64
	libasound.so=2-64
	libatspi.so=0-64
	libgcc_s.so=1-64
	libc.so=6-64
	ld-linux-x86-64.so=2-64
	libwayland-client.so=0-64
)

package(){
	# Extract package data
	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"
	# Copyright
	install -D -m644 "${pkgdir}/usr/share/doc/${_pkgname}/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYRIGHT"
	install -D -m644 "${pkgdir}/usr/lib/${_pkgname}/resources/app/.webpack/renderer/main_window/index.js.LICENSE.txt"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
