# Maintainer: CyrIng <xfreq[at]cyring[dot]fr>
# Contributor: CyrIng <xfreq[at]cyring[dot]fr>
pkgname=xdm-xfreq
pkgver=0.7
pkgrel=1
pkgdesc="A customized XDM for XFreq"
arch=(any)
license=('GPL')
url="http://github.com/cyring/xdm-xfreq"
depends=('xorg-xdm' 'xorg-xclock' 'xorg-xmessage' 'xorg-xdpyinfo' 'gawk')
optdepends=('xfreq-git' 'scrot' 'imagemagick' 'xorg-xsetroot' 'numlockx')
backup=(etc/xdm-xfreq/Xresources
	etc/xdm-xfreq/xdm-xfreq.rc
	etc/xdm-xfreq/xdm-config)
install=xdm-xfreq.install
source=(xdm-config
	Xsetup
	Xstartup
	Xresources
	Xsession
	xdm-xfreq.rc
	xdm-xfreq-xdesktops
	xdm-xfreq.service)
md5sums=('SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP')

package() {
  mkdir -p ${pkgdir}/etc/xdm-xfreq
  cp Xresources xdm-xfreq.rc xdm-config ${pkgdir}/etc/xdm-xfreq
  chmod 0755 ${pkgdir}/etc/xdm-xfreq/xdm-xfreq.rc
  mkdir -p ${pkgdir}/etc/X11/xdm/xdm-xfreq
  cp Xsession Xsetup Xstartup ${pkgdir}/etc/X11/xdm/xdm-xfreq
  chmod 0755 ${pkgdir}/etc/X11/xdm/xdm-xfreq/{Xsession,Xsetup,Xstartup}
  install -Dm755 ${srcdir}/xdm-xfreq-xdesktops ${pkgdir}/usr/lib/systemd/scripts/xdm-xfreq-xdesktops
  install -Dm0644 ${srcdir}/xdm-xfreq.service ${pkgdir}/usr/lib/systemd/system/xdm-xfreq.service
}
