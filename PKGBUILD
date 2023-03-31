# Maintainer: Roman Vasilev <2rvasilev@live.ru>
# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: nadolph
# Contributor: dcelasun
# Contributor: said
# Contributor: Kaurin <milos dot kaurin at gmail>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=filebot
pkgver=5.0.1
pkgrel=1
pkgdesc="The ultimate TV and Movie Renamer"
arch=('i686' 'x86_64' 'aarch64' 'armv7l' 'armv7h')
url="https://www.filebot.net/"
license=('Commercial')
depends=('jre11-openjdk' 'java11-openjfx>=11.0.10.u1' 'fontconfig' 'chromaprint')
makedepends=()
checkdepends=()

optdepends=('libzen: Required by libmediainfo'
            'libmediainfo: Read media info such as video codec, resolution or duration'
            'gvfs: Drag-n-Drop from GVFS remote filesystems')

provides=('filebot')

conflicts=('filebot47' 'filebot-git')
install=$pkgname.install
source=(
    "https://get.filebot.net/filebot/FileBot_${pkgver}/FileBot_${pkgver}-aur.tar.xz"
    "https://get.filebot.net/filebot/FileBot_${pkgver}/FileBot_${pkgver}-aur.tar.xz.asc"
    "filebot.sh"
)

sha256sums=('ec41d8103c56463754333d5f838e6d17e284e10328dc98e7026f2b4dfc560de8'
            'SKIP'
            'cf902ce1b126706d7f1c4bb3bb32002ed2c12170d97b13070f8a1202a2e6b123')
validpgpkeys=('B0976E51E5C047AD0FD051294E402EBF7C3C6A71')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
 
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  cp -dpr --no-preserve=ownership "${srcdir}/etc" "${srcdir}/usr" "${pkgdir}"
}
