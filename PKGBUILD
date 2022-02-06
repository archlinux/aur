# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=ansiwave-bin
_pkg=ansiwave
pkgver=1.4.0
pkgrel=2
pkgdesc="Client for ANSIWAVE BBS"
url="https://github.com/ansiwave/ansiwave"
arch=('x86_64')
license=('unlicense')
source=("$_pkg-$pkgver::$url/releases/download/$pkgver-linux/ansiwave"
        "https://raw.githubusercontent.com/ansiwave/ansiwave/master/UNLICENSE")
sha512sums=('cf03f2ab7eab5762bc420ef8c372c240a8bc4be3792569bc60253ead3eb2390d38cf396c99bdd2b9330fdde4e543cff318ae4e72411a8d8efa7182d127bb53a0'
            'aa647966e7fb62ffcd7bfc1e56a8ebe38e8384a36c14e07fec4ccf3be91ffa1b3bbd9798901fa7956056c26d124f067582366bdb9581db1f742291c86e64e39d')

package() {
  install -Dm755 "${srcdir}/$_pkg-$pkgver" "$pkgdir/opt/${_pkg}/ansiwave"
  install -Dm644 "${srcdir}/UNLICENSE" "$pkgdir/usr/share/licenses/${_pkg}/UNLICENSE"
 
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkg}/ansiwave "${pkgdir}/usr/bin"
}
