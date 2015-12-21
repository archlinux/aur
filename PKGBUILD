# Contributor:  <sirocco@ngs.ru>
pkgname=runzip
pkgver=1.4
pkgrel=1
pkgdesc="Convert filenames inside ZIP archives from autodetected older Russian encodings (koi8-r, koi8-u, cp866, windows-1251) to UTF-8"
arch=(i686 x86_64)
url="https://github.com/vlm/zip-fix-filename-encoding/releases"
license=(custom)
depends=('zlib')
source=("https://github.com/vlm/zip-fix-filename-encoding/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/vlm/zip-fix-filename-encoding/master/LICENSE")
sha256sums=('e3efc83744067815bb920df6aa706b87b2985dd6eccc9f76a9d9f668ddc8d44d'
            '97a5e3ed2793a375b322a690be0cae61a76f013c5b28124e71ee25694ce3f25c')


build() {
  cd ${pkgname}-${pkgver}

  ./configure
  make
}

package() {
  cd ${pkgname}-${pkgver}

  #make install DESTDIR="${pkgdir}"/usr/bin/
  install -Dm755 src/"${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 ../LICENSE $pkgdir/usr/share/licenses/"${pkgname}"/LICENSE 
}
