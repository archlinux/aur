# Maintainer: Bilal Elmoussaoui <bil.elmoussaoui@gmail.com>

pkgname=startupwmclassfixer
_gitname=StartupWMClassFixer
pkgver=0.1.1
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="Fix unrecognized, ugly or double icons in Linux."
arch=('i686' 'x86_64')
url="https://github.com/bil-elmoussaoui/${_gitname}"
license=('GPL-2.0')
provides=("$pkgname")
depends=('wget')
source=("${url}/archive/${_pkgver}.tar.gz")
sha256sums=('eecbfc49db3eac8346166c530d7d548de6cb22f4bebaf0a16f829bd39ffc3741')

package() {
  install -Dm755 "$srcdir/$_gitname-$pkgver/fix" "$pkgdir/opt/$_gitname/fix"
  install -Dm755 "$srcdir/$_gitname-$pkgver/database.csv" "$pkgdir/opt/$_gitname/database.csv"
  install -d "$pkgdir/opt/$_gitname"
  install -d "$pkgdir/usr/bin"
  ln -sf "/opt/$_gitname/fix" "$pkgdir/usr/bin/$_gitname"
}
