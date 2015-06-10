pkgname=openssh-ldap-helper
pkgver=20140927
pkgrel=2
pkgdesc="perform ssh pubkey validation through LDAP"
arch=('any')
url="https://github.com/lesovsky/uber-scripts/tree/master/openssh-ldap-helper"
license=('MIT')
depends=("openldap")
makedepends=("git")
source=("git+https://github.com/lesovsky/uber-scripts.git")
md5sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd "$srcdir/$_pkgname"
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

package() {
    cd "$srcdir"/uber-scripts
    install -D -m755 "linux/openssh-ldap-helper/openssh-ldap-helper" "$pkgdir/usr/lib/openssh-ldap-helper/openssh-ldap-helper"
    install -D -m644 "linux/openssh-ldap-helper/README.md" "$pkgdir/usr/share/doc/openssh-ldap-helper/README.md"
}
