# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=salti-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="A fast, feature rich multiple sequence alignment browser for FASTA files, built for the terminal"
arch=('x86_64')
url="https://github.com/Sam-Sims/salti"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_tag="salti-${pkgver}"
_dl="${url}/releases/download/${_tag}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/salti-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('bf6efcaf2dae6e9782c5a49b01359e45207052843d8163772f1d7079aa070c39')

package() {
  cd "salti-x86_64-unknown-linux-gnu"
  install -Dm755 "salti" "${pkgdir}/usr/bin/salti"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
