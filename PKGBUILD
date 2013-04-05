# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
_pkgname=gitodo
pkgname=$_pkgname-git
pkgver=13.01.5.g12160cb
pkgrel=1
pkgdesc="Manage your TODO items using Git as a backend"
arch=('any')
url='http://www.uninformativ.de/projects/?q=gitodo'
license=('custom:PIZZA-WARE')
makedepends=('git')
depends=('git' 'ruby')
optdepends=(
  'cron: Reminder functionality'
  'vim: A reasonable editor, syntax files are provided'
)
source=(git://github.com/vain/gitodo.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g; s|v||'
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 gitodo "$pkgdir"/usr/bin/gitodo
  install -Dm755 highcal "$pkgdir"/usr/bin/highcal
  install -Dm755 ics2gg "$pkgdir"/usr/bin/ics2gg

  install -Dm644 man1/gitodo.1 "$pkgdir"/usr/share/man/man1/gitodo.1
  install -Dm644 man1/highcal.1 "$pkgdir"/usr/share/man/man1/highcal.1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 vim/ftdetect/gitodo.vim \
    "$pkgdir"/usr/share/vim/vimfiles/ftdetect/gitodo.vim
  install -Dm644 vim/syntax/gitodo.vim \
    "$pkgdir"/usr/share/vim/vimfiles/syntax/gitodo.vim
}

# vim:set ts=2 sw=2 et:
