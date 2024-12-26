# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Oliver Jaksch <arch-aur _at_ com-in dot de>

set -u
pkgname='prog-express'
pkgver='3.8.9'
pkgrel='1'
pkgdesc='a control software for the Batronix USB programming devices to program FLASH/PROM/EPROM/EEPROM chips'
arch=('i686' 'x86_64')
url='http://www.batronix.com/'
license=('custom:Freeware')
depends=('xz' 'libarchive' 'mono' 'mono-basic' 'libusb' 'sqlite' 'libgdiplus')
depends+=('bash' 'glibc')
options=('!strip')
source_i686=("${url}/exe/Batronix/Prog-Express/deb/${pkgname}-${pkgver}-1.i386.deb")
source_x86_64=("${url}/exe/Batronix/Prog-Express/deb/${pkgname}-${pkgver}-1.amd64.deb")
md5sums_i686=('ff117cf1d13b26b9b11c38c2a64603b8')
md5sums_x86_64=('ff9a2654783cf493fc8d3a5b06ffec95')
sha256sums_i686=('72bb235845d828a48f1cc62054b8b18269cf5e012b724335862d2604f69ec2e2')
sha256sums_x86_64=('65eb70c96df77ab0e01b484572bdb204df6e2c471760f883e9073064bb87aa72')

package() {
  set -u
  cd "${pkgdir}"
  tar xf "${srcdir}/data.tar.xz"
  cp -pr lib/* 'usr/lib/'
  cp -pr usr/sbin/* 'usr/bin/'
  rm -rf 'lib/' 'usr/sbin/'
  set +u
}
set +u

