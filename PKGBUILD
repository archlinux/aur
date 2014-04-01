# Maintainer: Caleb Maclennan <caleb@alerque.com>
#
# Any suggestions welcome; please submit paches via Github:
# https://github.com/alerque/aur/tree/master/diradm-git

pkgname=diradm-git
pkgver=1.3_1_gf4b32ed
pkgrel=2
_branch=devel
pkgdesc="A simple bash script for managing posix users and groups stored in a LDAP directory"
arch=('any')
url="https://github.com/alerque/diradm"
license=('GPL2')
depends=('openldap')
conflicts=("${pkgname%-git}")
source=("git://github.com/alerque/${pkgname%-git}.git#branch=$_branch")
md5sums=('SKIP')
backup=('etc/diradm.conf')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/-/_/g'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -D -m755 diradm "$pkgdir"/usr/bin/"${pkgname%-git}"
  install -D -m644 diradm.conf "$pkgdir"/etc/diradm.conf
}
