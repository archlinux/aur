# Maintainer: lolilolicon <lolilolicon@gmail.com>

_name=FFcast
_ver=2.4.1
pkgname=ffcast
epoch=1
pkgver=${_ver//-/}
pkgrel=1
pkgdesc="FFcast has almost nothing to do with FFmpeg or screencast ;)"
arch=(any)
url="https://github.com/lolilolicon/FFcast"
license=(GPL3)
depends=('bash>=4.3' ffmpeg xorg-xdpyinfo xorg-xprop xorg-xwininfo xrectsel)
makedepends=(autoconf automake perl)
source=("https://github.com/lolilolicon/$_name/archive/$_ver.tar.gz")
md5sums=('ba43b7b6ef347b023fd3efa59f5b0429')

prepare() {
  cd "$_name-$_ver"
  ./bootstrap
}

build() {
  cd "$_name-$_ver"
  ./configure --prefix /usr --libexecdir /usr/lib --sysconfdir /etc \
    --disable-xrectsel
  make
}

package() {
  cd "$_name-$_ver"
  make DESTDIR="$pkgdir" install
}

# vim:st=2:sw=2:et:
