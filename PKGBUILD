# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu-bin
pkgver=4.10.1
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
conflicts=(gdu gdu-git)
arch=('x86_64')
url="https://github.com/Dundee/gdu"
source=("${pkgname}-${pkgver}.tgz::https://github.com/dundee/gdu/releases/download/v${pkgver}/gdu_linux_amd64.tgz"
	"${pkgname}.1-${pkgver}.tgz::https://github.com/dundee/gdu/releases/download/v${pkgver}/gdu.1.tgz"
	"LICENSE")
sha256sums=('7c5d6f7dedc643c59f3a17d46a1b7d017a606b5bc16a39f0ffa171eb7328d160'
            'eae9cc78ce563827117c5b73454a9ff93b8f6f2554784b7c4203bfbefbea699d'
            '613e9144d1403bba9553d64daf6a5e28d4c6bd9fabed81da80efaf91eb573dad')

package() {
  cd "$srcdir"
  install -Dm755 gdu_linux_amd64 "${pkgdir}"/usr/bin/gdu
  install -Dm644 gdu.1  "${pkgdir}"/usr/share/man/man1/gdu.1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/gdu/LICENSE"
}

