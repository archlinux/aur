# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=softethervpn-server-manager
pkgver=v4.44_9807
_realpkgver=${pkgver//_/-}-rtm-2025.04.16
pkgrel=1
pkgdesc="SoftEther VPN Server Manager"
arch=('i686' 'x86_64')
url="https://www.softether.org/"
license=('Apache')
depends=('desktop-file-utils' 'wine')
source=("https://www.softether-download.com/files/softether/${_realpkgver}-tree/Windows/Admin_Tools/VPN_Server_Manager_and_Command-line_Utility_Package/softether-vpn_admin_tools-${_realpkgver}-win32.zip"
        'vpnsmgr.desktop'
        'vpnsmgr.png'
        'vpnsmgr.sh')
md5sums=('d4ee2376f2697f4d32c8dc213ea898ba'
         'e3b4b8905f18330728afc17ad90570b3'
         '43aa41b68db7ec99b461f17cb6834396'
         '4fbbe5c79abb498a4ec71f8715c5a7db')

package() {
  install -D -m 755 vpnsmgr.sh "${pkgdir}/usr/bin/vpnsmgr"
  install -D -m 644 hamcore.se2 "${pkgdir}/usr/lib/softethervpn/vpnsmgr/hamcore.se2"
  install -D -m 644 vpnsmgr.exe "${pkgdir}/usr/lib/softethervpn/vpnsmgr/vpnsmgr.exe"
  install -D -m 644 vpnsmgr.desktop "${pkgdir}/usr/share/applications/vpnsmgr.desktop"
  install -D -m 644 vpnsmgr.png "${pkgdir}/usr/share/pixmaps/vpnsmgr.png"
}

# vim:set ts=2 sw=2 et:
