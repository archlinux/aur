# Maintainer: Roman Vasilev <2rvasilev@live.ru>
# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: nadolph
# Contributor: dcelasun
# Contributor: said
# Contributor: Kaurin <milos dot kaurin at gmail>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Bernhard Bermeitinger <bernhard.bermeitinger at gmail.com>

pkgname=filebot
pkgver=5.1.6
pkgrel=1
pkgdesc="The ultimate TV and Movie Renamer"
arch=('i686' 'x86_64' 'aarch64' 'armv7l' 'armv7h')
url="https://www.filebot.net/"
license=('Commercial')
depends=('java-runtime' 'fontconfig' 'chromaprint')
makedepends=()
checkdepends=()

optdepends=('libzen: Required by libmediainfo'
            'libmediainfo: Read media info such as video codec, resolution or duration'
            'gvfs: Drag-n-Drop from GVFS remote filesystems')

provides=('filebot')

conflicts=('filebot47' 'filebot-git')
install=$pkgname.install
source=("https://get.filebot.net/filebot/FileBot_${pkgver}/FileBot_${pkgver}-aur.tar.xz"
        "https://get.filebot.net/filebot/FileBot_${pkgver}/FileBot_${pkgver}-aur.tar.xz.asc"
        "filebot.sh")

sha256sums=('7b729146cf9f295eb505d789e4c30688626e21aa750f712ae8e85f28de3a91b0'
            'SKIP'
            '0a13948f208302a24101002cd794c0e1884724675f79970ee81bccb19bb5b8f9')
validpgpkeys=('B0976E51E5C047AD0FD051294E402EBF7C3C6A71')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"

  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  cp -dpr --no-preserve=ownership "${srcdir}/etc" "${srcdir}/usr" "${pkgdir}"
}
