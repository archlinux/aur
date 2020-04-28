# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mpv-thumbnail-script
pkgver=0.4.2
pkgrel=1
pkgdesc="A Lua script to show preview thumbnails in mpv's OSC seekbar, sans external dependencies"
arch=('any')
install=mpv-thumbnail-script.install
depends=('mpv' 'ffmpeg')
url='https://github.com/TheAMM/mpv_thumbnail_script'
license=('GPL-3.0')
source=("mpv-thumbnail-script-server.lua::https://github.com/TheAMM/mpv_thumbnail_script/releases/download/${pkgver}/mpv_thumbnail_script_server.lua"
		"mpv-thumbnail-script-client-osc.lua::https://github.com/TheAMM/mpv_thumbnail_script/releases/download/${pkgver}/mpv_thumbnail_script_client_osc.lua"
		'mpv_thumbnail_script.conf')
sha256sums=('ef5b1875432ff916c4c34c52f655410be24b934da56f33efdc4ebf4f1db8d489'
			'27e71f510f3a2c2e4be25082617aca277bfd118cbbeb95035cb579d704050fbd'
			'SKIP')

package() {
  install -Dm644 "${srcdir}/mpv-thumbnail-script-server.lua" -t "${pkgdir}/usr/share/mpv/scripts"
  install -Dm644 "${srcdir}/mpv-thumbnail-script-client-osc.lua" -t "${pkgdir}/usr/share/mpv/scripts"
  install -Dm644 "${srcdir}/mpv_thumbnail_script.conf" -t "${pkgdir}/etc/mpv-thumbnail-script"
  mkdir -p "${pkgdir}/usr/share/licenses/mpv-thumbnail-script"
  ln -s /usr/share/licenses/common/GPL3/license.txt "${pkgdir}/usr/share/licenses/mpv-thumbnail-script/LICENSE"
}