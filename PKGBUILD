# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=x360tm-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="Browse and install Xbox 360 mods, trainers, saves and homebrew to a console over FTP"
arch=('x86_64')
url="https://github.com/wb2024/wbs360studiotui"
license=('MIT')
depends=('glibc' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug' '!strip')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/wb2024/wbs360studiotui/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/x360tm-linux.tar.gz")
sha256sums=('df8ef21d1ec750faf43e62378de07741f1342d9ef68f066c0827c210ff5fd1dc')
sha256sums_x86_64=('223169ad5c395d0fdc603868dc4601f75675ab714ea76125f1ff51236b8f4fa8')

package() {
  install -Dm755 "x360tm" "${pkgdir}/usr/bin/x360tm"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
