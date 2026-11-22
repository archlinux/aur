# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lazyslurm-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="A lazygit-style terminal UI"
arch=('x86_64')
url="https://github.com/hill/lazyslurm"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/hill/lazyslurm/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/lazyslurm-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('77c8c6c9c240fabdf5e323c26ce10b5402fdcf9f2446924d2caf6b411dab0eb3')
sha256sums_x86_64=('50759c00fcb58b83690d80f4e1c6dfe02f1c899e69e18933881ca9db73fce7aa')

package() {
  install -Dm755 "lazyslurm" "${pkgdir}/usr/bin/lazyslurm"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
