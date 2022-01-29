# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu-bin
pkgver=5.13.0
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
sha256sums=('cb0cce71b823ec7a4bee81faf41f89ee56aeea0b51dc5e8e5080b5165182a407'
            '15c8d9d15c4f62db3141e466c35a68496219ff2b8e3b6fc5337641c764f41aec'
            '613e9144d1403bba9553d64daf6a5e28d4c6bd9fabed81da80efaf91eb573dad')

package() {
  cd "$srcdir"
  install -Dm755 gdu_linux_amd64 "${pkgdir}"/usr/bin/gdu
  install -Dm644 gdu.1  "${pkgdir}"/usr/share/man/man1/gdu.1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/gdu/LICENSE"
}

