pkgname="autorestic-bin"
pkgver=1.8.3
_pkgid="${pkgname%-bin}-${pkgver}"
pkgrel=1
pkgdesc="High level CLI utility for restic"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/cupcakearmy/${pkgname%-bin}"
license=('Apache')
depends=('restic')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

sha256sums_i686=('3fd866b8e87d0bc1c58d570740182c058ed32052641d11894b4a3072e8001d9a')
sha256sums_x86_64=('2bce52253dc78bb94ad3fe848868a8a3bf52ca3543a8f89019a9d49b271ecf46')
sha256sums_armv7h=('c6ff0afb6225652cd79590478514576ade1590dfba9a4b386645c91645cb11fa')
sha256sums_aarch64=('6d0534dccb43f4faa677cd0ca8e9b00bece3fa15eb78ce4d49fdac2819d2c027')

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