# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=diradm
pkgname=${_pkgname}-git
pkgver=1.3_1_gf4b32ed
pkgrel=1
_branch=devel
pkgdesc="A simple bash script for managing posix users and groups stored in a LDAP directory"
arch=('any')
url="https://github.com/alerque/diradm"
license=('GPL2')
depends=('openldap')
conflicts=("$_pkgname")
source=("git://github.com/alerque/$_pkgname.git#branch=$_branch")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/-/_/g'
}

package() {
  cd "$srcdir/$_pkgname"
  install -D -m755 diradm "$pkgdir"/usr/bin/"$_pkgname"
  install -D -m644 diradm.conf "$pkgdir"/etc/diradm.conf
}
