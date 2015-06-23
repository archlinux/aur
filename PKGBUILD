# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=vim-better-indent-support-for-php-with-html-git
pkgver=20130518
pkgrel=1
pkgdesc="Vim indent script for PHP"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
conflicts=('vim-php-indent-git')
url="https://github.com/captbaritone/better-indent-support-for-php-with-html"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/captbaritone/better-indent-support-for-php-with-html)
sha256sums=('SKIP')
provides=('vim-better-indent-support-for-php-with-html')
conflicts=('vim-better-indent-support-for-php-with-html')


pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd $srcdir/vim-better-indent-support-for-php-with-html/

  mkdir -p $pkgdir/usr/share/doc/$pkgname
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/readme.md"
 
  cd $srcdir/vim-better-indent-support-for-php-with-html/indent/
  mkdir -p $pkgdir/usr/share/vim/vimfiles/indent/
  install -Dm 644 php.vim "$pkgdir/usr/share/vim/vimfiles/indent/"


}
