# Maintainer: Anton Makrushin <makrusan at gmail dot com>

pkgname=agterm-linux-bin
pkgver=0.33.1+linux.1
pkgrel=1
pkgdesc='Native terminal with a workspace and session sidebar, built on libghostty'
arch=(x86_64)
url='https://github.com/melonamin/agterm-linux'
license=(MIT)
depends=(bash glibc gtk4 libadwaita webkitgtk-6.0 libepoxy)
provides=(agterm-linux)
conflicts=(agterm-linux)
options=(!strip !debug)
source=("$url/releases/download/linux-v$pkgver/agterm-linux-v$pkgver-x86_64.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/melonamin/agterm-linux/linux-v$pkgver/LICENSE")
sha256sums=('b75c2f27441e0dca20149b22aff2bc665dee3fcc3e84965b151287e5fafafadc'
            '155d97114b2d9b7f66181d0ba258aca57f97b8b957dd1662745bf57218c41ef3')

package() {
  install -d "$pkgdir/opt" "$pkgdir/usr/bin" "$pkgdir/usr/share"
  cp -a agterm-linux "$pkgdir/opt/"
  ln -s /opt/agterm-linux/bin/agterm-linux "$pkgdir/usr/bin/agterm-linux"
  ln -s /opt/agterm-linux/bin/agtermctl "$pkgdir/usr/bin/agtermctl"
  cp -a agterm-linux/share/applications agterm-linux/share/icons "$pkgdir/usr/share/"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
