# Maintainer: Alexandru Ianu <alexandru.ianu@gmail.com>
# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Alexandru Ianu <alexandru.ianu@gmail.com>

pkgname=steam-native
pkgver=1.0.0.52
pkgrel=3
pkgdesc="Sets a native runtime environment for Steam by default, adds a Steam runtime launcher for compatibility."
arch=('i686' 'x86_64')
url='http://steampowered.com/'
license=('GPL2')
install="${pkgname}.install"

source=('steam-runtime.desktop'
	'51-steam.rules')

sha256sums=('6135682caab8f75e803d8f2e57e5645cbff3fb40f5bd2286125319e1fd3b24e3'
	'10996aea68afc633b614404fd91143b738ce0fd929af91659f4c6dd960776c40')

depends=('steam' 'networkmanager')
depends_i686=('openal' 'gtk2' 'libgcrypt15' 'libnl' 'libpng12' 'gconf' 'nss' 'libpulse' 'libxss' 'gnutls28' 'libudev0')
depends_x86_64=('lib32-openal' 'lib32-gtk2' 'lib32-libgcrypt15' 'lib32-libnl' 'lib32-libpng12' 'lib32-gconf'
	'lib32-nss' 'lib32-libpulse' 'lib32-libxss' 'lib32-gnutls28' 'lib32-libudev0' 'lib32-libnm-glib')

# TODO: Add specific function of each package (e.g. what applications/games it is needed for)
optdepends=('mono: game dependency'
	'mono-addins: game dependency'
	'libcurl-gnutls: game dependency'
	'libcurl-compat: game dependency'
	'glew1.10: game dependency'
	'rtmpdump: game dependency'
	'librtmp0: game dependency')
optdepends_i686=('libappindicator-gtk2: needed if tray icon not working (Gnome)'
	'libappindicator-gtk3: needed if tray icon not working (Gnome)'
	'sdl: game dependency'
	'sdl_image: game dependency'
	'sdl_mixer: game dependency'
	'sdl_ttf: game dependency'
	'sdl2: game dependency'
	'sdl2_image: game dependency'
	'sdl2_mixer: game dependency'
	'sdl2_ttf: game dependency'
	'tcp_wrappers-libs: game dependency'
	'speex: game dependency'
	'gperftools: game dependency'
	'libvpx: game dependency'
	'libcaca: game dependency'
	'libtheora: game dependency'
	'libtiff4: game dependency')
optdepends_x86_64=('lib32-libappindicator-gtk2: needed if tray icon not working (Gnome)'
	'lib32-libappindicator-gtk3: needed if tray icon not working (Gnome)'
	'lib32-sdl: game dependency'
	'lib32-sdl_image: game dependency'
	'lib32-sdl_mixer: game dependency'
	'lib32-sdl_ttf: game dependency'
	'lib32-sdl2: game dependency'
	'lib32-sdl2_image: game dependency'
	'lib32-sdl2_mixer: game dependency'
	'lib32-sdl2_ttf: game dependency'
	'lib32-tcp_wrappers-libs: game dependency'
	'lib32-speex: game dependency'
	'lib32-gperftools: game dependency'
	'lib32-libvpx: game dependency'
	'lib32-libcaca: game dependency'
	'lib32-libtheora: game dependency'
	'lib32-libtiff4: game dependency'
	'lib32-libcurl-gnutls: game dependency'
	'lib32-libcurl-compat: game dependency'
	'lib32-glew1.10: game dependency'
	'lib32-rtmpdump: game dependency'
	'lib32-librtmp0: game dependency'
	'libudev0: needed for most 64 bit games')

package() {
	install -Dm644 'steam-runtime.desktop' -t "${pkgdir}/usr/share/applications/"
	install -Dm644 '51-steam.rules' -t "${pkgdir}/etc/polkit-1/rules.d/"
	chmod -f 750 "${pkgdir}/etc/polkit-1/rules.d" # fix permission warning
}
