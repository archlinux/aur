# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=xfce4-volumed-pulse
_vmaj=0.2
_vmin=3
pkgver=$_vmaj.$_vmin
pkgrel=2
pkgdesc='A volume keys control daemon for Xfce using pulseaudio'
arch=('i686' 'x86_64')
license=('GPL3')
conflicts=('xfce4-volumed')
replaces=('xfce4-volumed')
url="https://git.xfce.org/apps/$pkgname"
depends=('libnotify' 'pulseaudio' 'libkeybinder3' 'xfconf')
optdepends=('xfce4-notifyd: for OSD notifications')
sha256sums=('13bbf24b8bb52d9ba9b53929764ec0ea4d5ee26aaf71f01fbd021fc9794cc3e0')
source=("http://archive.xfce.org/src/apps/$pkgname/$_vmaj/$pkgname-$pkgver.tar.bz2")

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
