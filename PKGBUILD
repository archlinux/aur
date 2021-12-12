# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu-bin
pkgver=5.12.1
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
sha256sums=('d31705e46b20b07e467d3a3cbf8c5bb34a9b8018ec8bbd2e6eefa1e075e9adbe'
            'b4907081c7aae90c886a43cca701849bb56dc712a6c79dded5433c80c40aa418'
            '613e9144d1403bba9553d64daf6a5e28d4c6bd9fabed81da80efaf91eb573dad')

package() {
  cd "$srcdir"
  install -Dm755 gdu_linux_amd64 "${pkgdir}"/usr/bin/gdu
  install -Dm644 gdu.1  "${pkgdir}"/usr/share/man/man1/gdu.1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/gdu/LICENSE"
}

