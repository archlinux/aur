# Maintainer: CyrIng <xfreq[at]cyring[dot]fr>
# Contributor: CyrIng <xfreq[at]cyring[dot]fr>
pkgname=xdm-xfreq
pkgver=0.1
pkgrel=1
pkgdesc="A customized XDM for XFreq"
arch=(any)
license=('GPL')
url="http://github.com/cyring/xdm-xfreq"
depends=('xorg-xdm' 'xorg-xclock' 'xorg-xmessage' 'xfreq-git')
optdepends=('scrot' 'imagemagick' 'xorg-xsetroot' 'numlockx')
backup=(etc/xdm-xfreq/Xresources
	etc/xdm-xfreq/config.sh)
install=xdm-xfreq.install
source=(xdm-config
	Xsetup
	Xstartup
	Xresources
	Xsession
	config.sh
	xdm-xfreq.service)
md5sums=('SKIP')

package() {
  mkdir -p ${pkgdir}/etc/xdm-xfreq
  cp Xresources config.sh ${pkgdir}/etc/xdm-xfreq
  chmod 0755 ${pkgdir}/etc/xdm-xfreq/config.sh
  mkdir -p ${pkgdir}/etc/X11/xdm/xdm-xfreq
  cp Xsession Xsetup Xstartup xdm-config ${pkgdir}/etc/X11/xdm/xdm-xfreq
  chmod 0755 ${pkgdir}/etc/X11/xdm/xdm-xfreq/{Xsession,Xsetup,Xstartup}
  install -Dm0644 ${srcdir}/xdm-xfreq.service ${pkgdir}/usr/lib/systemd/system/xdm-xfreq.service
}
