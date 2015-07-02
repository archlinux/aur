# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=mp4tools
pkgver=0.6.8
pkgrel=1
pkgdesc="Set of scripts to encode audio and video do MP4"
arch=('any')
url="http://teknoraver.net/software/mp4tools/"
#url="https://launchpad.net/~teknoraver/+archive/ppa"
license=('GPL3')
depends=('bash' 'gpac' 'mplayer' 'faac' 'aacplusenc' 'amrenc')
source=(https://launchpad.net/~teknoraver/+archive/ppa/+files/mp4tools_$pkgver.tar.gz \
        audiorip_fix_mplayer.diff)
md5sums=('21ecc4d840b4f611d41126d84505645a'
         'ba335fa5e4eb7df474a25f79a2161a7e')

prepare() {
  cd "$srcdir/$pkgname"
  patch -Np0 < "$srcdir"/audiorip_fix_mplayer.diff || true
}

package() {
  cd "$srcdir/$pkgname"
  make INSTDIR="$pkgdir/usr" install
}
