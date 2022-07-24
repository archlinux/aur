# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_name=gsjackctl
_uuid=$_name@cbix.de
pkgname=gnome-shell-extension-$_name
pkgver=2
pkgrel=1
pkgdesc='GNOME Shell JACK Control'
arch=(any)
url='https://github.com/cbix/gsjackctl'
license=(GPL2)
groups=(pro-audio)
depends=()
optdepends=('a2jmidid: can be controlled by the extension')
source=("$pkgname-$pkgver.zip::https://github.com/cbix/$_name/releases/download/v$pkgver/$_uuid.zip")
sha256sums=('dbf04cdf2beedddbdd3970f5c408159ce85a61754f4dfd953d75ac093f9e1f08')
noextract=($pkgname-$pkgver.zip)

package() {
  depends+=('gnome-shell>=3.38' jack2-dbus)
  _path="$pkgdir"/usr/share/gnome-shell/extensions/$_uuid
  install -d "$_path"
  bsdtar -xvof $pkgname-$pkgver.zip -C "$_path"
}
