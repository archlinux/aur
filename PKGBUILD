# Maintainer: kumen

pkgname="mcuviewer-bin"
pkgver=1.2.4
pkgrel=1
pkgdesc="Real-time embedded variable & trace viewer "
arch=("x86_64")
depends=("libusb" "glfw" "gtk3" "glib2")
optdepends=('jlink-software-and-documentation' 'stlink' 'arm-none-eabi-gdb')
conflicts=('mcuviewer' 'mcuviewer-git')
provides=('mcuviewer')
url="https://mcuviewer.com"
license=('comercial')
options=(!strip)

source=(${pkgname}.zip::https://download.mcuviewer.com/releases/stable/1.2.4_7a22eaa/MCUViewer_Linux.zip)
sha256sums=('601f5f9e86c03e608e925cda988378782c52580027476ee2b35a2ec7a894a37c')


prepare()
{
  bsdtar xvf ${srcdir}/MCUViewer-${pkgver}-Linux.deb
}

package()
{
  bsdtar xvf ${srcdir}/data.tar.gz -C "$pkgdir"
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/local/bin"
  ln -s /usr/local/MCUViewer/MCUViewer "${pkgdir}/usr/local/bin/"
}

#
# makepkg --printsrcinfo > .SRCINFO
#
