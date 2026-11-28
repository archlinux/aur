# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=upgit-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Upload files and clipboard content to various storage backends"
arch=('x86_64' 'aarch64')
url="https://github.com/pluveto/upgit"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/pluveto/upgit/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/upgit_linux_amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/upgit_linux_arm64.zip")
sha256sums=('f870859ec7f8614515937f37e827bec431d63a373eafe6eeeb9fec670a29d6d1')
sha256sums_x86_64=('2300e70565b0b8b889be84872f7a8d1eb8122fd7013b472d81041bbb0f5224d8')
sha256sums_aarch64=('ba0d6643b2e5d4465ebdb8ee474a11d930bad86ef0fe2b735a2077b57b05e20d')

package() {
  install -Dm755 "upgit" "${pkgdir}/usr/bin/upgit"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
