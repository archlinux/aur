# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=xfce4-volumed-pulse
_vmaj=0.2
_vmin=4
pkgver=$_vmaj.$_vmin
pkgrel=1
pkgdesc='A volume keys control daemon for Xfce using pulseaudio'
arch=('i686' 'x86_64')
license=('GPL3')
conflicts=('xfce4-volumed')
replaces=('xfce4-volumed')
url="https://gitlab.xfce.org/apps/$pkgname"
depends=('libnotify' 'pulseaudio' 'libkeybinder3' 'xfconf')
makedepends=('git' 'xfce4-dev-tools')
optdepends=('xfce4-notifyd: for OSD notifications')
sha256sums=('a019e3f626b31c0aaa0b807962606645cc0caf7930882b034a5a3a1719858362')
source=("https://archive.xfce.org/src/apps/$pkgname/$_vmaj/$pkgname-$pkgver.tar.bz2")

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib \
              --localstatedir=/var
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
