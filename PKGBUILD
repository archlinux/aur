## PKGBUILD
# https://github.com/sixsixfive/0nyX/tree/master/%40extra/PKGS/PKGBUILD
pkgname=onyx-suite
pkgver=1.02
pkgrel=1
pkgdesc='Everyday usable dark theme mainly made for Xfce, IceWM or Openbox.'
arch=('any')
url='https://github.com/sixsixfive/0nyX'
depends=('sed')
makedepends=('git' 'coreutils')
optdepends=('qt5ct'
	'qt5-svg'
	'qt5-styleplugins'
	'xcursor-vanilla-dmz'
	'gtk3-nocsd'
	'xfwm4'
	'marco'
	'icewm'
	'openbox'
	'xfce4-notifyd'
	'xfdashboard'
	'plank'
	'slim'
	'onboard'
	'audacious'
	'qmmp'
	'albert'
	'gtk2'
	'gtk3>=3.20'
	'gtk-engines')
install="install"
provides=("${pkgname}=$pkgver")
#kde gtk config breaks gtks font settings!
conflicts=("${pkgname}" "kde-gtk-config")
license=(CCPL:cc-by-sa-4.0)
source=("https://raw.githubusercontent.com/sixsixfive/0nyX/master/debian/0nyx-theme-current.deb")
sha256sums=('SKIP')
 
package() {
	_tmpdir=$pkgdir
        cd $srcdir
        tar xJf data.tar.xz

        cp -r usr/ $pkgdir/
        chmod -R 755 ${_tmpdir}
}
