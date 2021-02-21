# Maintainer: linuxer <linuxer@artixlinux.org> 
# Contributor: linuxer <linuxer@artixlinux.org> 

pkgname=cameracontrol
pkgdesc="Webcam, camera and microphone control for Linux - Έλεγχος webcam και camera και μικροφώνου για Linux"
pkgver=2.2.0
pkgrel=1
_pkgver="${pkgver//./-}"
arch=('any')
url="https://gitea.artixlinux.org/linuxer/camera-control-webcam-switch-indicator"
license=('FPC modified LGPL Version 2')
depends=('qt5pas' 'lsof' 'kvantum-qt5' 'libnotify' 'notify-osd')
conflicts=('cameramonitor' 'cameracontrol-bin')
optdepends=('qt5ct: Qt5 Configuration Utility' 
            'qt5gtk2: another GTK+2.0 integration plugins for Qt5'
            'qt5-styleplugins: additional style plugins for Qt5')
source=("CameraControl-"$_pkgver".tar.bz2::https://codeberg.org/attachments/016fb3ac-a234-47ad-bde5-df21103037ef")
b2sums=('f749accd0f939267e2167f6a01e56e2aff572ed4a7bfd302069ac3db0fcd24d257fb058bbb2898779e1fc2375fe688cd7110aed1b2baf05988d40a8d3ffcecf5')


package() {
  cd "$srcdir"
  install -Dm755 "$pkgname.bin" -t "$pkgdir/opt/CameraControl"
  install -Dm755 CameraControl.sh "$pkgdir/opt/CameraControl"
  install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -D -m0644 org.artixlinux.cameracontrol.policy "${pkgdir}"/usr/share/polkit-1/actions/org.artixlinux.cameracontrol.policy
  install=cameracontrol.install
}
