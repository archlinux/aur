# Maintainer: vinibali <vinibali1 at gmail dot com>

pkgname=kingston_fw_updater
pkgver=205
pkgrel=011
pkgdesc="Kingston's utility to update SSD firware on Sandforce based drives, created by James Huey. For more information please look the project's github page."
arch=(i686 x86_64)
url="https://github.com/vinibali/kingston_fw_updater"
license=('GPLv2')
depends=(lib32-fontconfig freetype2 gcc-libs glibc libice lib32-libjpeg6-turbo lib32-libpng12 lib32-libsm libx11 lib32-libxext lib32-libxrender zlib)
source=(https://gitlab.com/vinibali/kingston_fw_updater/-/archive/master/kingston_fw_updater-master.zip)
md5sums=(cc6c408219978c6f65b681a67caf1772)

package() {
	mkdir "${pkgdir}"/custom
	mkdir -p "${pkgdir}"/opt/kfu/firmware
	mkdir -p "${pkgdir}"/usr/bin

	install -Dm755 "${srcdir}"/kingston_fw_updater-master/bin/kfu "${pkgdir}"/opt/kfu/bin/kfu
	cp -a "${srcdir}"/kingston_fw_updater-master/firmware/ "${pkgdir}"/opt/kfu/
	ln -s /opt/kfu/firmware "${pkgdir}"/custom/firmware
	ln -s /opt/kfu/bin "${pkgdir}"/custom/bin
	ln -s /opt/kfu/bin/kfu "${pkgdir}"/usr/bin/kfu
}
