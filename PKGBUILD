# Maintainer: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=gns3-gui
pkgver=1.3.7
pkgrel=1
pkgdesc='GNS3 network simulator. Graphical user interface package.'
arch=('any')
url='https://github.com/GNS3/gns3-gui'
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-apache-libcloud' 'python-paramiko' 'python-requests' 'python-raven' 'python-sip' 'gns3-converter' 'python-pyqt4') 
optdepends=('gns3-server: GNS3 backend. Manages emulators such as Dynamips, VirtualBox or Qemu/KVM.'
            'dynamips: Cisco router emulator.'
            'xterm: Default terminal emulator for CLI management of virtual instances.'
            'wireshark-gtk: Live packet capture.')
conflicts=('gns3' 'gns3-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GNS3/${pkgname}/archive/v${pkgver}.tar.gz"
        'gns3.desktop')
md5sums=('9e4eff79f41488f50273be3a11192be4'
         'ac6ba60be0a1cb7fc965d1a105e431d5')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
  install -Dm644 ${srcdir}/gns3.desktop ${pkgdir}/usr/share/applications/gns3.desktop
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/resources/images/gns3_icon_256x256.png ${pkgdir}/usr/share/pixmaps/gns3.png
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
