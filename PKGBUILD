# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Tim Yang <tdy@gmx.com>
# Contributor: JJDaNiMoTh <jjdanimoth.aur@gmail.com>
# Contributor: Travis Nickles <ryoohki7@yahoo.com>
# Contributor: Haw-Bin Chai <hbchai@gmail.com>

pkgname=dvd-slideshow
pkgver=0.8.4
pkgrel=3
pkgdesc="Scripts for creating slideshow DVDs with menus, audio, and fancy effects"
arch=('any')
url="http://dvd-slideshow.sourceforge.net"
license=('GPL')
depends=('bc' 'cdrkit' 'dvdauthor' 'jhead' 'netpbm' 'sox' 'toolame' 'transcode' 'vorbis-tools')
install=$pkgname.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-1.tar.gz)
sha256sums=('484f71614ab45205f6133829c431b9a631cb0251de9b97993a9361648d0607e7')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-1"

  for _file in `ls man | sed 's/\.1//'`; do
    install -Dm755 $_file "${pkgdir}/usr/bin/$_file"
    install -Dm644 man/$_file.1 "${pkgdir}/usr/share/man/man1/$_file.1"
    install -Dm644 doc/$_file.html "${pkgdir}/usr/share/doc/$pkgname/$_file.html"
  done

  install -Dm644 "${pkgname}rc" "${pkgdir}/usr/share/$pkgname/${pkgname}rc"
}
