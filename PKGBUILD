# Maintainer: linuxer <linuxer@artixlinux.org> 
# Contributor: linuxer <linuxer@artixlinux.org> 

pkgname=cameracontrol-bin
alias=cameracontrol
pkgdesc="Webcam, camera and microphone control for Linux - Έλεγχος webcam και camera και μικροφώνου για Linux"
pkgver=2.2.0
pkgrel=2
_pkgver="${pkgver//./-}"
arch=('any')
url="https://gitea.artixlinux.org/linuxer/camera-control-webcam-switch-indicator"
license=('FPC modified LGPL Version 2')
depends=('qt5pas' 'lsof' 'kvantum-qt5' 'libnotify' 'notify-osd')
conflicts=('cameramonitor' 'cameracontrol-bin')
optdepends=('qt5ct: Qt5 Configuration Utility' 
            'qt5gtk2: another GTK+2.0 integration plugins for Qt5'
            'qt5-styleplugins: additional style plugins for Qt5')
install=cameracontrol.install
source=("Cameracontrol-${pkgver}.tar.bz2::https://codeberg.org/attachments/d1fdd3ee-963c-4f46-904e-bc660721be9c")
sha256sums=('ec781c9981d741ee5ca2aaa8afcabb8abc5e60c6dedfa3a09d4b2065e4ecff2a')


package() {
  cd "$srcdir"
  install -Dm755 "$alias.bin" -t "$pkgdir/opt/CameraControl"
  install -Dm755 CameraControl.sh "$pkgdir/opt/CameraControl"
  install -Dm644 "$alias.desktop" -t "$pkgdir/usr/share/applications"
  install -D -m0644 org.artixlinux.cameracontrol.policy \
    -t "${pkgdir}"/usr/share/polkit-1/actions
}
