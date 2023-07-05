# Original maintainer: Clint Valentine <valentine.clint@gmail.com>
# Maintainer: Kerbiriou Maël <m431.kerbiriou@gmail.com>

pkgname=seqkit-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="A cross-platform and ultrafast toolkit for FASTA/Q file manipulation in Golang"
arch=('x86_64')
url=http://bioinf.shenwei.me/seqkit
license=('MIT')
provides=('seqkit')
conflicts=('seqkit')
source=(
  https://github.com/shenwei356/seqkit/releases/download/v"${pkgver}"/seqkit_linux_amd64.tar.gz
  https://raw.githubusercontent.com/shenwei356/seqkit/v"${pkgver}"/LICENSE
)
sha256sums=('317b476d2437312f8cd2600da322e42098dd57652054e52843061869df1bf1ad'
            'ffa76e8a163f7a8785ccf4f517d601d562d2a68fbd019de9b2eccf49c9b89730')

package() {
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname//-bin/}"/LICENSE
  install -Dm775 "${srcdir}"/"${pkgname//-bin/}" "${pkgdir}"/usr/bin/"${pkgname//-bin/}"
}
