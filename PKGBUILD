# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu-bin
pkgver=5.19.0
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
provides=(gdu)
conflicts=(gdu)
arch=('x86_64')
url="https://github.com/Dundee/gdu"
source=("${pkgname}-${pkgver}.tgz::https://github.com/dundee/gdu/releases/download/v${pkgver}/gdu_linux_amd64.tgz"
	"${pkgname}.1-${pkgver}.tgz::https://github.com/dundee/gdu/releases/download/v${pkgver}/gdu.1.tgz"
	"LICENSE")
sha256sums=('1fcbe6bf1fb2186998264b566d2b33b2167b7bbb8ede578d0f076016c9b52790'
            'c3477ffc516c805c8d041b4f21734df518c8742a51bc318e44562a5760b282be'
            '613e9144d1403bba9553d64daf6a5e28d4c6bd9fabed81da80efaf91eb573dad')

package() {
  cd "$srcdir"
  install -Dm755 gdu_linux_amd64 "${pkgdir}"/usr/bin/gdu
  install -Dm644 gdu.1  "${pkgdir}"/usr/share/man/man1/gdu.1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/gdu/LICENSE"
}

