# k311 <seamail311@yandex.ru>

pkgname='mplayer-gui'
pkgver='1.4'
_sver='1'
pkgrel='3'
pkgdesc='GUI for mplayer'
arch=('x86_64')
url='http://www.mplayerhq.hu/'
license=('GPL')
depends=('mencoder' 'mplayer' 'libjpeg6-turbo')
install=${pkgname}.install
source=("http://download1.rpmfusion.org/free/fedora/updates/30/x86_64/m/mplayer-gui-1.4-1.fc30.x86_64.rpm"
        "http://download-ib01.fedoraproject.org/pub/fedora/linux/releases/30/Everything/x86_64/os/Packages/l/libcdio-2.0.0-4.fc30.x86_64.rpm")
md5sums=('a4c418e33c92593932bd8a939dd3032c'
         '2672e9a2b6f20003c464dd31f49bcaae')

build() {
  cd ${srcdir}
  bsdtar -xf libcdio-2.0.0-4.fc30.x86_64.rpm ./usr/lib64/libcdio.so.18.0.0
  mv ${srcdir}/usr/lib64/libcdio.so.18.0.0 ${srcdir}/usr/lib/libcdio.so.18
  rm -rf ${srcdir}/usr/lib64 ${srcdir}/usr/share/doc ${srcdir}/usr/share/info ${srcdir}/usr/share/man ${srcdir}/usr/share/licenses ${srcdir}/usr/bin/cdda-player ${srcdir}/usr/bin/cd-drive ${srcdir}/usr/bin/cd-info ${srcdir}/usr/bin/cd-read ${srcdir}/usr/bin/iso-info ${srcdir}/usr/bin/iso-read ${srcdir}/usr/bin/mmc-tool
  bsdtar -xf "mplayer-gui-1.4-1.fc30.x86_64.rpm" -C .
  mv ${srcdir}/usr/share/applications/mplayer.desktop ${srcdir}/usr/share/applications/gmplayer.desktop
}  

package() {
  cd ${srcdir}
  mv usr ${pkgdir}
}
