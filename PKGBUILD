# Maintainer: Michael Egger
#gpg key avaible at gpg --keyserver pgp.mit.edu --recv-keys DB68D18158C19A535A538524507F8DFE0C99485B
pkgname=vpndemon
pkgver=3.0
pkgrel=6
pkgdesc="VPNKS protects you against leaks caused by disconnetction"
arch=('any')
url="https://github.com/plasticbrain/vpnkillswitch"
license=('GPL')
depends=('networkmanager' 'libnm-glib' 'networkmanager-openvpn' 'nm-connection-editor' 'openvpn' 'systemd')
makedepends=('bash')
source=(https://github.com/primaryobjects/vpndemon/archive/master.zip
)
sha384sums=('a750b66d813750d9aa63ed76e79d1c51c39b2619835fa9571fa2ead8b04d64333c7424646211cf53f4e6422aa0af88dc'
)
sha256sums=('e93b043e621644752d688f8c45836bd7b5f6f283fbcf2e9241afea35ed0221b7'
)
sha512sums=('38da3528540b4aa9cbe539dc2769ff76e73a734cd4a15ce2fe0f66978a9825d4e36a39c5dac8ce4deb5bac2a1f22b67d876d55a0c8b38544d9120b64597bf08a'
)
package() {	mkdir -p "${pkgdir}/usr/bin"
        for file in ${srcdir}/vpndemon-master/vpnde*
	do
		install -D -m644 "${file}" "${pkgdir}/usr/bin/"
	done
        echo "If you've questions about this package, please read: http://mikeeverhart.net/2015/12/vpn-killswitch-bash-script/"
        echo "For recovery your connection please run # vpnkillswitch up" 
        mv ${pkgdir}/usr/bin/vpndemon.sh  ${pkgdir}/usr/bin/vpndemon
        chmod +x ${pkgdir}/usr/bin/vpndemon
          
}

# vim:set ts=2 sw=2 et:
