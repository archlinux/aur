# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: Patrick Ulbrich <zulu99 at gmx . net>

_pkgname=mailnag-goa-plugin
pkgname=$_pkgname-git
pkgver=20191104.r15.a8ccbe7
pkgrel=2
pkgdesc='Mailnag GNOME Online Accounts Plugin'
arch=('any')
url='https://github.com/pulb/mailnag-goa-plugin'
license=('GPL')
depends=('mailnag' 'gnome-online-accounts')
source=("git+$url")
sha512sums=('SKIP')
conflicts=("$_pkgname")
provides=("$_pkgname")

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname
  python setup.py install --root="$pkgdir"
}
