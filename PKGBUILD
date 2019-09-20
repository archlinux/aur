# Original maintainer: Clint Valentine <valentine.clint@gmail.com>
# Maintainer: Kerbiriou Maël <m431.kerbiriou@gmail.com>

pkgname=seqkit-bin
pkgver=0.10.2
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
sha256sums=('cdd31667ebfe2fd35c64492066a6d867419bab6dc16ead85129a0816116fe348'
            'ed4edd3cebd268236a0a8f86ba5d7fcafc7e21e170bd1fa8ca3b9404bbf7d941')

package() {
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname//-bin/}"/LICENSE
  install -Dm775 "${srcdir}"/"${pkgname//-bin/}" "${pkgdir}"/usr/bin/"${pkgname//-bin/}"
}
