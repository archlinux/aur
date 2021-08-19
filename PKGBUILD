# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu-bin
pkgver=5.6.0
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
conflicts=(gdu gdu-git)
arch=('x86_64')
url="https://github.com/Dundee/gdu"
source=("${pkgname}-${pkgver}.tgz::https://github.com/dundee/gdu/releases/download/v${pkgver}/gdu_linux_amd64.tgz"
	"${pkgname}.1-${pkgver}.tgz::https://github.com/dundee/gdu/releases/download/v${pkgver}/gdu.1.tgz"
	"LICENSE")
sha256sums=('6e23cc8fdca1e6570b6b4465e21e3fec246d24aa5d7eccf3bca9e635846d45ec'
            '8e0de2f3470c95839ab2d5e9247161e832ade6997fd8057fdce6975aac9362a6'
            '613e9144d1403bba9553d64daf6a5e28d4c6bd9fabed81da80efaf91eb573dad')

package() {
  cd "$srcdir"
  install -Dm755 gdu_linux_amd64 "${pkgdir}"/usr/bin/gdu
  install -Dm644 gdu.1  "${pkgdir}"/usr/share/man/man1/gdu.1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/gdu/LICENSE"
}

