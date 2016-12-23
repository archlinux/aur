pkgname=tt-rss-auth-ldap-git
_gitname=TTRSS-Auth-LDAP
pkgver=r44.c4a2073
pkgrel=1
pkgdesc="Tiny Tiny RSS plugin for LDAP authentication"
arch=('any')
url="https://github.com/hydrian/TTRSS-Auth-LDAP"
license=('GPL2')
depends=('tt-rss' 'php-ldap')
makedepends=('git')
provides=('tt-rss-auth-ldap')
conflicts=('tt-rss-auth-ldap')
source=('git+https://github.com/hydrian/TTRSS-Auth-LDAP.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  install -d -m755 "$pkgdir/usr/share/webapps/tt-rss/plugins/auth_ldap/"
  install -D -m644  plugins/auth_ldap/init.php "$pkgdir/usr/share/webapps/tt-rss/plugins/auth_ldap/"
}

