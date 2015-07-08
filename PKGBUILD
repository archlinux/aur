# Maintainer: justbrowsing <developer4linux+aur@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Dogukan Korkmazturk <d.korkmazturk@gmail.com>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>
 
pkgname=justbrowsing-adeskbar
pkgver=0.5.1
pkgrel=6
pkgdesc="A lightweight application launcher configured for JustBrowsing"
arch=('any')
url="https://github.com/justbrowsing/justbrowsing-adeskbar"
license=('GPL3')
depends=('python2-xdg' 'python2-xlib' 'pygtk')
optdepends=('justbrowsing-theme: icons for panel'
			'jbxkb: keymap systray'
			'batterymon-clone: battery systray'
			'network-manager-applet-gtk2: networking systray' 
			'pnmixer: volume systray')
conflicts=("adeskbar")
groups=("justbrowsing")
source=("https://github.com/justbrowsing/${pkgname}/archive/master.zip")
install="adeskbar.install"
md5sums=('8ec567eee4a141de4fca8308c46b6cfb')
 
package() {
  cd $srcdir/${pkgname}-master

  # Install
  install -d ${pkgdir}/usr/share/adeskbar
  cp -a src/* ${pkgdir}/usr/share/adeskbar

  # Executable
  install -Dm555 adeskbar ${pkgdir}/usr/bin/adeskbar
  chmod +x ${pkgdir}/usr/bin/adeskbar

  # Desktop launcher
  install -Dm644 applications.menu ${pkgdir}/etc/xdg/menus/adeskbar-applications.menu
  install -Dm644 src/images/adeskbar.png ${pkgdir}/usr/share/pixmaps/adeskbar.png
  install -Dm644 adeskbar.desktop ${pkgdir}/usr/share/applications/adeskbar.desktop
  install -Dm644 src/extras/LICENSE ${pkgdir}/usr/share/licenses/adeskbar/LICENSE
}


