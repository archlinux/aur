# Maintainer: Roman Vasilev <2rvasilev@live.ru>
# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: nadolph
# Contributor: dcelasun
# Contributor: said
# Contributor: Kaurin <milos dot kaurin at gmail>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: mithrial <mithrial@mailbox.org>

pkgname=filebot
pkgver=5.3.0
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

b2sums=('1ddefbdaf288ff8b3ca0513b77d1b37ed409cd47dc843e8ea953b0245db58790a246b6f89318fcdb2243b6ea919f183e8ce71ee4ee05dd144306646f47000bad'
        'SKIP'
        'ef7d2169f2a71925835678a481b1a063f4d11a49ce741affd70d59dd1ef940f17090dd60383de2da4008e08823117796dc3b4c7e4805dd4de2a89d4c4805f66f')
validpgpkeys=('B0976E51E5C047AD0FD051294E402EBF7C3C6A71')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"

  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  cp -dpr --no-preserve=ownership "${srcdir}/etc" "${srcdir}/usr" "${pkgdir}"
}
