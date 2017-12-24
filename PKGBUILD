# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
pkgname=asciiplanets-git
pkgver=15.09.2.g5cba80c
pkgrel=1
pkgdesc="ASCII solar system observer"
arch=('any')
url="https://github.com/vain/asciiplanets"
license=('MIT')
depends=('bash' 'coreutils' 'ncurses' 'python-pyephem')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git://github.com/vain/asciiplanets.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --always | sed 's|-|.|g; s|v||'
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -Dm755 "${pkgname%-git}" "$pkgdir"/usr/bin/"${pkgname%-git}"
  install -Dm755 "${pkgname%-git}"-interactive \
      "$pkgdir"/usr/bin/"${pkgname%-git}"-interactive

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -Dm644 man1/"${pkgname%-git}".1 \
    "$pkgdir"/usr/share/man/man1/"${pkgname%-git}".1
  install -Dm644 man1/"${pkgname%-git}"-interactive.1 \
    "$pkgdir"/usr/share/man/man1/"${pkgname%-git}"-interactive.1
}
