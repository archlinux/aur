# k311 <seamail311@yandex.ru>

pkgname='mplayer-gui'
pkgver='1.4'
_sver='3'
pkgrel='7'
pkgdesc='GUI for mplayer'
arch=('x86_64')
url='http://www.mplayerhq.hu/'
license=('GPLv3+')
depends=('mencoder' 'mplayer' 'libjpeg6-turbo')
install=${pkgname}.install
source=("http://download1.rpmfusion.org/free/fedora/development/rawhide/Everything/x86_64/os/Packages/m/mplayer-gui-1.4-3.fc32.x86_64.rpm"
        "http://download-ib01.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/l/libcdio-2.0.0-5.fc31.x86_64.rpm")
md5sums=('SKIP'
         'SKIP')

build() {
  cd ${srcdir}
  bsdtar -xf "mplayer-gui-1.4-3.fc32.x86_64.rpm" -C .
  bsdtar -xf libcdio-2.0.0-5.fc31.x86_64.rpm ./usr/lib64/libcdio.so.18.0.0
  mv ${srcdir}/usr/lib64/libcdio.so.18.0.0 ${srcdir}/usr/lib/libcdio.so.18
  rm -rf ${srcdir}/usr/lib64 ${srcdir}/usr/share/doc ${srcdir}/usr/share/info ${srcdir}/usr/share/man ${srcdir}/usr/share/licenses ${srcdir}/usr/bin/cdda-player ${srcdir}/usr/bin/cd-drive ${srcdir}/usr/bin/cd-info ${srcdir}/usr/bin/cd-read ${srcdir}/usr/bin/iso-info ${srcdir}/usr/bin/iso-read ${srcdir}/usr/bin/mmc-tool ${srcdir}/usr/lib/.build-id
  mv ${srcdir}/usr/share/applications/mplayer.desktop ${srcdir}/usr/share/applications/gmplayer.desktop
}  

package() {
  cd ${srcdir}
  mv usr ${pkgdir}
}
