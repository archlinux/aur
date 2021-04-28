# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu-bin
pkgver=4.11.1
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
conflicts=(gdu gdu-git)
arch=('x86_64')
url="https://github.com/Dundee/gdu"
source=("${pkgname}-${pkgver}.tgz::https://github.com/dundee/gdu/releases/download/v${pkgver}/gdu_linux_amd64.tgz"
	"${pkgname}.1-${pkgver}.tgz::https://github.com/dundee/gdu/releases/download/v${pkgver}/gdu.1.tgz"
	"LICENSE")
sha256sums=('b01234139a6f229edce46dbf2b105bada35ddc70e2cf796ca88dc70f6756900d'
            'a96bb5330d71de2b55d01834062e46c3520046d11d49ae74396ebcf8ecc32c6e'
            '613e9144d1403bba9553d64daf6a5e28d4c6bd9fabed81da80efaf91eb573dad')

package() {
  cd "$srcdir"
  install -Dm755 gdu_linux_amd64 "${pkgdir}"/usr/bin/gdu
  install -Dm644 gdu.1  "${pkgdir}"/usr/share/man/man1/gdu.1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/gdu/LICENSE"
}

