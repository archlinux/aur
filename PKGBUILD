pkgname="autorestic-bin"
pkgver=1.7.1
_pkgid="${pkgname%-bin}-${pkgver}"
pkgrel=1
pkgdesc="High level CLI utility for restic"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/cupcakearmy/${pkgname%-bin}"
license=('Apache')
depends=('restic')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

sha256sums_i686=('df1bb179bac39fdcfa478bde1c2d6685da5272e3dd043aa9ec89605061c7ccd4')
sha256sums_x86_64=('d90e9a390155c6b9b8044dfa8a5abc55f62cff32807ce5b0e46e69f0f5f40d93')
sha256sums_armv7h=('0d63efaf2bf92930c6f06e7d8cb221e6586d9ffc85676b35f4f6e41dc6c790ed')
sha256sums_aarch64=('4c8ed131029ed82a42a0409a40c4e1dac88e9ff4584af2d291ae19cd10e846e5')

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
