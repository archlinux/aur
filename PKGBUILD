# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kronk-bin
pkgver=1.33.3
pkgrel=1
pkgdesc="Hardware-accelerated local inference in Go with llama.cpp, whisper.cpp and stable-diffusion.cpp"
arch=('x86_64' 'aarch64')
url="https://github.com/ardanlabs/kronk"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kronk_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kronk_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('3f2c379fc3334282be38ab5d54aede8007fef230dd73fd0a39c7a52bf3e2f896')
sha256sums_aarch64=('39a2bde74875382e84a840d3237eaa3e3922ae5a75f977ec449f9ba5fcff98c2')

package() {
  install -Dm755 "kronk" "${pkgdir}/usr/bin/kronk"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
