# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=xperia-flashtool
_realname=flashtool
pkgver=0.9.33.0
pkgrel=1
pkgdesc="A S1 protocol flashing software for Sony Xperia phones"
arch=('x86_64')
url="http://www.flashtool.net/"
license=('GPL3')
depends=('libselinux' 'libsystemd' 'glib2' 'mono')
# It is suggested to use BT to fetch the source
# Get it from http://www.flashtool.net/downloads_linux.php
# Mirror in comment area: https://mega.nz/file/esFSwJ6S#5zKpTuWIPtSPnzwF_4_OaCg6MD6h8EMIJVPQsOOtyDo
# Uploaded file: http://uploaded.net/file/ynh02q32
source=("file:///${_realname}-${pkgver}-linux.tar.xz"
        "${pkgname}.sh")
# As provided upstream
md5sums=('4eaea1819b731b592ce71ed6ba95e544'
         '457c5decbc0f5ace3d0d9b98dfdd9ffa')
options=('!strip')

package() {
  # Install all the program files
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  cp -rt "${pkgdir}/usr/lib/${pkgname}" FlashTool/*
  # Install launcher scripts
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
