# Maintainer: Ivan Volkov <angrycore at yandex dot ru>

pkgname=bitrix24
pkgver=14.3.10
pkgrel=1
pkgdesc="Official Bitrix24 client for Linux."
arch=("x86_64")
url="https://www.bitrix24.com/applications.php"
source=("https://dl.bitrix24.com/b24/bitrix24_desktop.rpm")
md5sums=('f7f8a61288f8ad0354beeea6a00ebd00')
depends=(
   'gtk3'
   'libnotify'
   'nss'
   'libxss'
   'alsa-lib'
   )


package() {
   cd "${srcdir}/"
   for _x in usr opt
   do
      cp -r --preserve=mode "$_x/" "${pkgdir}"
   done

   mkdir -p "${pkgdir}/usr/bin"
   cd "${pkgdir}/usr/bin/"
   for _x in Bitrix24-web Bitrix24 BDisk
   do
      ln -s "../../opt/Bitrix24/$_x" .
   done
}
