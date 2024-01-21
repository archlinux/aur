# Maintainer: Mark Wagie <mark dot wagie at proton dot me>

# Check for new version (currently not working):
# curl -s https://flavio.tordini.org/sofa-server-ws/release.xml | tr -dc 0-9.

pkgname=sofa-server
pkgver=1.5
pkgrel=1
pkgdesc="Turn your phone or tablet into a remote control for your GNOME desktop."
arch=('x86_64')
url="https://flavio.tordini.org/sofa"
license=('unknown')
depends=('avahi' 'gnome-shell' 'libnotify' 'qt5-base' 'qt5-imageformats' 'qt5-websockets' 'systemd')
source=("$pkgname-$pkgver.deb::https://flavio.tordini.org/files/sofa/$pkgname.deb")
sha256sums=('a93284b71fdbe987ede0fb32dbf093882a4e8cb254fa0b9392bc3a41d15170ab')

package() {
  bsdtar xvf "data.tar.xz" -C "$pkgdir/"

  rm -rf "$pkgdir/usr/share/menu/"
  rm "$pkgdir/usr/share/$pkgname/scripts/.DS_Store"
}
