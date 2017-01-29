# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=xquisite-icon-theme
pkgver=0.4.6
pkgrel=2
pkgdesc="An icon theme based on prior Exquisites and modified from various sources"
url="https://www.xfce-look.org/p/1015861"
arch=('any')
license=('GPL')
options=(!strip !emptydirs)
conflicts=('xfce4-xquisite-icon-theme')
replaces=('xfce4-xquisite-icon-theme')
provides=('adwaita-icon-theme')
source=("xquisite-$pkgver.tar.bz2::http://download2146.mediafire.com/w18544rcl85g/lozb6ec3no9a233/Xquisite.tbz")
sha256sums=('1f035fbe1beea9c3ab5086f330b950d8d4b75750fbe39f28cdd127184b223551')

package() {
  mkdir -p "$pkgdir/usr/share/icons/xquisite"
  cp -a Xquisite/* "$pkgdir/usr/share/icons/xquisite"
  
  # set permissions to 644 as nothing needs to be executable
  find "$pkgdir" -type f -print0 | xargs -0 chmod 644
}
