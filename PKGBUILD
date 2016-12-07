# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=xfce4-volumed-pulse
_vmaj=0.2
_vmin=2
pkgver=$_vmaj.$_vmin
pkgrel=1
pkgdesc='A volume keys control daemon for Xfce using pulseaudio'
arch=('i686' 'x86_64')
license=('GPL3')
conflicts=('xfce4-volumed')
replaces=('xfce4-volumed')
url="https://git.xfce.org/apps/$pkgname"
depends=('libnotify' 'pulseaudio' 'libkeybinder2' 'xfconf')
optdepends=('xfce4-notifyd: for OSD notifications')
sha256sums=('0ec315cd87943466e35c0572541bf4239730604236e5d793e4d9f46856d04c76')
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
