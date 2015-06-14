# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
_pkgname=gitary
pkgname=$_pkgname-git
pkgver=15.03
pkgrel=1
pkgdesc="A diary using git as its backend"
arch=('any')
url='http://www.uninformativ.de/projects/?q=gitary'
license=('custom:PIZZA-WARE')
makedepends=('git')
depends=('git')
optdepends=(
  'vim: A reasonable editor, syntax files are provided'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git://github.com/vain/gitary.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g; s|v||'
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 gitary "$pkgdir"/usr/bin/gitary
  install -Dm644 man1/gitary.1 "$pkgdir"/usr/share/man/man1/gitary.1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 vim/ftdetect/gitary.vim \
    "$pkgdir"/usr/share/vim/vimfiles/ftdetect/gitary.vim
  install -Dm644 vim/syntax/gitary.vim \
    "$pkgdir"/usr/share/vim/vimfiles/syntax/gitary.vim
}

# vim:set ts=2 sw=2 et:
