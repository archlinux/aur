# Maintainer: vik <vik at divd dot net>

pkgname=filebot-cli
pkgver=5.2.1
pkgrel=1
pkgdesc="The ultimate TV and Movie Renamer"
arch=('i686' 'x86_64' 'aarch64' 'armv7l' 'armv7h')
url="https://www.filebot.net/"
license=('Commercial')
depends=('java-runtime-headless' 'mediainfo')
makedepends=()
checkdepends=()
provides=('filebot')
options=(!strip)
conflicts=('filebot47' 'filebot')
source=("https://get.filebot.net/filebot/FileBot_${pkgver}/FileBot_${pkgver}-aur.tar.xz")
sha256sums=('da5bd7f4025033a485adbcfcaa12fc8250ccb25b027c78ea051e18601f569b05')

package() {
    mkdir -p "${pkgdir}/usr/share" "${pkgdir}/usr/bin"
    cp -dpr --no-preserve=ownership "${srcdir}/usr/share/filebot" "${pkgdir}/usr/share"
    ln -sf "/usr/share/filebot/bin/filebot.sh" "${pkgdir}/usr/bin/filebot"
}
