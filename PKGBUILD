# Maintainer: Bilal Elmoussaoui <bil.elmoussaoui@gmail.com>

pkgname=startupwmclassfixer
_gitname=StartupWMClassFixer
pkgver=0.1
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="Fix unrecognized, ugly or double icons in Linux."
arch=('i686' 'x86_64')
url="https://github.com/bil-elmoussaoui/${_gitname}"
license=('GPL')
provides=("$pkgname")
depends=('wget')
source=("${url}/archive/${_pkgver}.tar.gz")
sha256sums=('2a9da8d1c9e73a25b51a6ebe86d979680ed273d9adc22adfa9d2fe63f2b3af74')

package() {
  install -Dm755 "$srcdir/$_gitname-$pkgver/fix" "$pkgdir/opt/$_gitname/fix"
  install -Dm755 "$srcdir/$_gitname-$pkgver/database.csv" "$pkgdir/opt/$_gitname/database.csv"
  install -d "$pkgdir/opt/$_gitname"
  install -d "$pkgdir/usr/bin"
  ln -sf "$pkgdir/opt/$_gitname/fix" "$pkgdir/usr/bin/$_gitname"
}
