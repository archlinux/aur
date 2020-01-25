# Maintainer: Francois Menning <f.menning@protonmail.com>
# Contributer: Martchus <martchus@gmx.net>

pkgname=crazycat-dvb-firmware
pkgver=20180309
pkgrel=1
pkgdesc='DVB firmware from CrazyCat media_build repo'
arch=('any')
url="https://bitbucket.org/CrazyCat/media_build"
license=('GPL3')
conflicts=('openelec-dvb-firmware')
provides=('crazycat-dvb-firmware')
makedepends=('linux-firmware')
source=("https://bitbucket.org/CrazyCat/media_build/downloads/dvb-firmwares.tar.bz2")
sha256sums=('bbba5ea89ad65f535e22bfa97d0ad172b677cfbde4f7b399fc0b2e31a148d95e')

package() {
  cd "${srcdir}"
  for _file in $(find -type f); do
    if [[ ! -f /usr/lib/firmware/$_file ]]; then
      install -Dm644 "$_file" "${pkgdir}/usr/lib/firmware/$_file"
    fi
  done
}
