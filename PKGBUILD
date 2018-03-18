# Maintainer: vinibali <vinibali1 at gmail dot com>

pkgname=kingston_fw_updater
pkgver=205
pkgrel=010
pkgdesc="Kingston's utility to update SSD firware on Sandforce based drives, created by James Huey. For more information please look the project's github page."
arch=(i686 x86_64)
url="https://github.com/vinibali/kingston_fw_updater"
license=('GPLv2')
depends=(fontconfig freetype2 gcc-libs glibc libice libjpeg6-turbo libpng12 libsm libx11 libxext libxrender zlib)
source=(https://github.com/vinibali/kingston_fw_updater/archive/master.zip)
md5sums=(c99b7ff77f0236a4921c042406ae6f53)

package() {
	mkdir -p "${pkgdir}"/opt/kfu/firmware
	mkdir "${pkgdir}"/custom
	install -Dm755 "${srcdir}"/kingston_fw_updater-master/bin/kfu "${pkgdir}"/opt/kfu/kfu
	cp -a "${srcdir}"/kingston_fw_updater-master/firmware/ "${pkgdir}"/opt/kfu/
	ln -s /opt/kfu/firmware "${pkgdir}"/custom/firmware
}