# Maintainer: Oliver Paschke <oli.paschke@gmail.com>

pkgname=tt-rss-auth-ldap-git
_gitname=TTRSS-Auth-LDAP
pkgver=r60.582ade4
pkgrel=1
pkgdesc="Tiny Tiny RSS plugin for LDAP authentication"
arch=('any')
url="https://github.com/hydrian/TTRSS-Auth-LDAP"
license=('Apache')
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
  _instdir="$pkgdir/usr/share/webapps/tt-rss/plugins.local/auth_ldap/"
  cd "$_gitname"
  install -d -m755 "$_instdir"
  install -D -m644 plugins/auth_ldap/init.php "$_instdir"
}
