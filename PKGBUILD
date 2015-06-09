# Maintainer: archlinux at carstenfeuls dot de
pkgname=cumulus
pkgver=5.21.0
pkgrel=1
pkgdesc="Cumulus is a free and Open Source flight computer for Linux"
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://www.kflog.org/cumulus/"
license=('custom')
depends=('qt4')
source=('https://github.com/kflog-project/Cumulus/archive/master.zip'
	'cumulus.desktop')
sha256sums=('03669ac4302c4bf0d607f0a3d50cf3f0cbfff9a13dc745f327e48339093a3fbf'
            'efd04ecd966383d491dbd1fcfe22918c56653825a57c5778de56dc040e685087')

build() {
  cd "${srcdir}/Cumulus-master"
  make -f Makefile.X11 all
}

package() {
  cd "${srcdir}/Cumulus-master"
  install -d ${pkgdir}/usr/share/applications
  install --mode=644 ${srcdir}/cumulus.desktop ${pkgdir}/usr/share/applications/
  make INSTALL_ROOT=${pkgdir}/opt/cumulus -f Makefile.X11  install 
}
