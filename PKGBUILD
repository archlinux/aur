pkgname="autorestic-bin"
pkgver=1.8.1
_pkgid="${pkgname%-bin}-${pkgver}"
pkgrel=1
pkgdesc="High level CLI utility for restic"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/cupcakearmy/${pkgname%-bin}"
license=('Apache')
depends=('restic')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

sha256sums_i686=('0c9a256c91fd736983c7cad38e5e3e596f88e920a6bd45631671b679bc3d8e24')
sha256sums_x86_64=('5f737614922d31dc2f0a15b59e1ec58d1eb709e8f7f785da67da44a6560043d9')
sha256sums_armv7h=('f31639544fa7af5725d6513680bbaa2d562b2e127787e48970df85dcc2b18d32')
sha256sums_aarch64=('daed906a200de79b655d40ecd3f3e57e21f92787f5faf04229d8eb5bd9b00bce')

source_i686=("${pkgname%-bin}-${pkgver}-i686.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.bz2")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.bz2")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.bz2")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.bz2"::"${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm.bz2")

prepare() {
  bzip2 -fdc ${pkgname%-bin}-${pkgver}-$CARCH.bz2 > autorestic
  chmod +x autorestic
}

package() {
  mkdir -p "${pkgdir}/usr/local/bin/"
  cp "${srcdir}/autorestic" "${pkgdir}/usr/local/bin/autorestic"
}