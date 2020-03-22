# Maintainer: YagiOoda <YagiOoda@pm.me>
pkgname=everdo
pkgver=1.3.4
pkgrel=2
pkgdesc="The Perfect App for GTD / Getting Things Done"
arch=('x86_64')
url='https://everdo.net'
license=('unknown')

depends=(
	'c-ares' 
	'ffmpeg' 
	'gtk3'
	'http-parser' 
	'libevent' 
	'libvpx' 
	'libxslt' 
	'libxss' 
	'minizip' 
	'nss' 
	're2' 
	'snappy' 
	'libnotify' 
	'libappindicator-gtk2' 
	'libappindicator-gtk3' 
	'gconf'
	)

source=("https://d11l8siwmn8w36.cloudfront.net/$pkgver/$pkgname-$pkgver.pacman")

package() {
    # Install the application files in /opt
    install -d "${pkgdir}/opt"
    cp -R "${srcdir}/opt/Everdo" "${pkgdir}/opt/"
    # Install the .desktop file
    install -D -m644 "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    # Install the icons
    for icon_size in 32 64 128 256 512 1024; do
        icons_dir="/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
        install -d "${pkgdir}/${icons_dir}"
        install -m644 "${srcdir}${icons_dir}/${pkgname}.png" \
                      "${pkgdir}${icons_dir}/${pkgname}.png"
    done
}
md5sums=('815d348031e4619e7ecb45487ae1451e')
