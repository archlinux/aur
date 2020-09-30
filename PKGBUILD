# Maintainer: Francois Menning <f.menning@protonmail.com>
# Contributer: Martchus <martchus@gmx.net>

pkgname=crazycat-dvb-firmware
pkgver=20200730
pkgrel=1
pkgdesc='DVB firmware from CrazyCat media_build repo'
arch=('any')
url="https://github.com/crazycat69/media_build"
license=('GPL3')
conflicts=('openelec-dvb-firmware')
provides=('crazycat-dvb-firmware')
makedepends=('linux-firmware')
source=("https://github.com/crazycat69/media_build/releases/download/latest/dvb-firmwares.tar.bz2")
sha256sums=('2aed0c3385572b11fd6d5202cc3114b82b865573d264ba03a87939f2437d90bf')

package() {
  cd "${srcdir}"
  for _file in $(find -type f); do
    if [[ ! -f /usr/lib/firmware/$_file ]]; then
      install -Dm644 "$_file" "${pkgdir}/usr/lib/firmware/$_file"
    fi
  done
}
