# Maintainer: AnbuBlack <dana_blonda2004@yahoo.com>
pkgname=zymp3
pkgver=0.1.7
pkgrel=1
pkgdesc="youtube-dl and ffmpeg frontend, converts videos to mp3"
url="https://github.com/silvernode/zymp3"
arch=('x86_64' 'i686')
license=('GPL')
depends=('youtube-dl' 'ffmpeg' 'zenity' 'xdg-utils')
optdepends=('yad' 'libnotify')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://github.com/silvernode/zymp3/archive/v${pkgver}.tar.gz")
md5sums=('d8aaa699d51b1e5c6fa9668962dc67dd')

package() {
  #tar zxvf "${srcdir}/${pkgname}-${pkgver}.tar.gz"
  cd ${pkgname}-${pkgver}
  install -Dm755 "${pkgname}" "${pkgdir}/opt/zymp3/${pkgname}"
  cp -R "config" "${pkgdir}/opt/zymp3/"
  cp -R "assets" "${pkgdir}/opt/zymp3/"
  cp -R "lib" "${pkgdir}/opt/zymp3/"
  echo '#!/bin/bash' > ${pkgdir}/opt/zymp3/run.sh
  echo "cd /opt/zymp3" >> ${pkgdir}/opt/zymp3/run.sh
  echo "./zymp3" >> ${pkgdir}/opt/zymp3/run.sh
  install -D ${pkgdir}/opt/zymp3/run.sh ${pkgdir}/usr/bin/zymp3
  chmod +x ${pkgdir}/usr/bin/zymp3
  install -Dm644 assets/zymp3.desktop "$pkgdir/usr/share/applications/zymp3.desktop"
  install -Dm644 assets/zymp3.png "$pkgdir/usr/share/pixmaps/zymp3.png"
                            
}
