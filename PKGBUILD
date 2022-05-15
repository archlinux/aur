# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=ansiwave-bin
_pkg=ansiwave
pkgver=1.6.0
pkgrel=1
pkgdesc="Client for ANSIWAVE BBS"
url="https://github.com/ansiwave/ansiwave"
arch=('x86_64')
license=('unlicense')
source=("$_pkg-$pkgver::$url/releases/download/$pkgver-linux/ansiwave"
        "https://raw.githubusercontent.com/ansiwave/ansiwave/master/UNLICENSE")
sha512sums=('b9d9a9f7920b9644cf2568c6c2ae42853a2957c09bd4e3614f4f11733de1a32fefb0c0178b37ee1d4163624c3d5e32242909ad6dc636c67009e5eb7588fa41b3'
            'aa647966e7fb62ffcd7bfc1e56a8ebe38e8384a36c14e07fec4ccf3be91ffa1b3bbd9798901fa7956056c26d124f067582366bdb9581db1f742291c86e64e39d')

package() {
  install -Dm755 "${srcdir}/$_pkg-$pkgver" "$pkgdir/opt/${_pkg}/ansiwave"
  install -Dm644 "${srcdir}/UNLICENSE" "$pkgdir/usr/share/licenses/${_pkg}/UNLICENSE"
 
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkg}/ansiwave "${pkgdir}/usr/bin"
}
