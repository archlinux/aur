# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=ansiwave-bin
_pkg=ansiwave
pkgver=1.8.0
pkgrel=1
pkgdesc="Client for ANSIWAVE BBS"
url="https://github.com/ansiwave/ansiwave"
arch=('x86_64')
license=('unlicense')
source=("$_pkg-$pkgver::$url/releases/download/$pkgver-linux/ansiwave"
        "https://raw.githubusercontent.com/ansiwave/ansiwave/master/UNLICENSE")
sha512sums=('89156319874415b2e794154379cf263180bfcb44fdc991c6046ada871b4d786ee1efb7214bffaeba1d91db04f5180dba828da77a671329a2bcf812abff4ac27c'
            'aa647966e7fb62ffcd7bfc1e56a8ebe38e8384a36c14e07fec4ccf3be91ffa1b3bbd9798901fa7956056c26d124f067582366bdb9581db1f742291c86e64e39d')

package() {
  install -Dm755 "${srcdir}/$_pkg-$pkgver" "$pkgdir/opt/${_pkg}/ansiwave"
  install -Dm644 "${srcdir}/UNLICENSE" "$pkgdir/usr/share/licenses/${_pkg}/UNLICENSE"
 
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkg}/ansiwave "${pkgdir}/usr/bin"
}
