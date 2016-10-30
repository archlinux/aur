# Maintainer: Michael Egger

pkgname=vpnks
pkgver=1.0
pkgrel=4
pkgdesc="VPNKS protects you against leaks caused by disconnetction"
arch=('any')
url="https://github.com/plasticbrain/vpnkillswitch"
license=('GPL')
depends=('networkmanager' 'libnm-glib' 'networkmanager-openvpn' 'nm-connection-editor' 'openvpn' 'systemd')
makedepends=('bash')
source=(https://github.com/plasticbrain/vpnkillswitch/archive/master.zip)
md5sums=('763d77798dc0ce97e3a7bf700e4fec7c')
sha1sums=('2dc64aa2234530a37d356e32c41e36647848aabd')
sha224sums=('ac3a0f8582ae1e80bbf7eecd6378192dc100571dcf06911183fcc06a')
sha256sums=('e107ec50d245f9d47961ffb4f3ad44ba6790b46208e7ad00cff8c53f47845ff1')
sha384sums=('5d3fe6b1d25fbef52c50c4e39f848836d635f028093ebd98f0a077485f659123b226e4a00754b96e741e3177fa93fb49')
sha512sums=('fb35d31ddf88cd25c0e81efdd99c52f69444a08015e4b7585fcbcb804623b035b36433ee508956f1d1ac8b852812912a2cc3afcb1fa504a4d355ea785dda8d3c')

package() {	
        sed 's/eth0/wlp0s29f7u3/' ${srcdir}/vpnkillswitch-master/vpnkillswitch.sh
        echo "Please replace eth0 with your network interface at vpnkillswitch.sh"
	mkdir -p "${pkgdir}/usr/bin"
        for file in ${srcdir}/vpnkillswitch-master/*.sh
	do
		install -D -m644 "${file}" "${pkgdir}/usr/bin/"
	done
        echo "If you've questions about this package, please read: http://mikeeverhart.net/2015/12/vpn-killswitch-bash-script/"
        echo "For recovery your connection please run # vpnkillswitch up" 
        sed 's/eth0/wlp0s29f7u3/' "${pkgdir}/usr/bin/vpnkillswitch.sh"  
}

# vim:set ts=2 sw=2 et:
