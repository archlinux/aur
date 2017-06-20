# Maintainer: Lars Hagström <lars@foldspace.nu>
pkgname=s-tui-git
pkgver=r76.0d148ab
pkgrel=1
pkgdesc="Terminal UI stress test and monitoring tool "
arch=('any')
url="https://github.com/amanusk/s-tui"
license=('GPLv2')
groups=()
depends=('stress' 'python2' 'python2-urwid')
makedepends=('git' 'python-setuptools')
options=(!emptydirs)
install=
source=("$pkgname"::"git+$url")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

