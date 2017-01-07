# Contributed by ivoarch <ivkuzev@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de

pkgname=aurel-git
pkgver=v0.8.20.ge264f9d.2017_01_06
pkgrel=1
pkgdesc="Search and download AUR packages from Emacs"
arch=('any')
url="https://github.com/alezost/aurel"
license=('GPL')
depends=('emacs')
makedepends=('git')
install=$pkgname.install
source=("git+https://github.com/alezost/aurel.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf %s.%s $(git describe --tags|tr - .) $(git log -1 --format="%cd" --date=short | tr - _)
}

package() {
  _pkg_emacs="$pkgdir/usr/share/emacs/site-lisp/"

  cd "$srcdir/${pkgname%-git}"
  install -d $_pkg_emacs
  cp *.el $_pkg_emacs
}
