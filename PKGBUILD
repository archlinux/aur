# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=seqkit-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="A cross-platform and ultrafast toolkit for FASTA/Q file manipulation in Golang"
arch=('x86_64')
url=http://bioinf.shenwei.me/seqkit
license=('MIT')
provides=('seqkit')
conflicts=('seqkit')
source=(
  https://github.com/shenwei356/seqkit/releases/download/v"${pkgver}"-dev/seqkit_linux_amd64.tar.gz
  https://raw.githubusercontent.com/shenwei356/seqkit/v"${pkgver}"-dev/LICENSE
)
sha256sums=(
  'ae46e0c5731f5f81936134d8308c90d3811fb28897d04b9de51b48ce4be8439c'
  'ed4edd3cebd268236a0a8f86ba5d7fcafc7e21e170bd1fa8ca3b9404bbf7d941'
)

package() {
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname//-bin/}"/LICENSE
  install -Dm775 "${srcdir}"/"${pkgname//-bin/}" "${pkgdir}"/usr/bin/"${pkgname//-bin/}"
}
