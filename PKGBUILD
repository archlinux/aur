# Contributor: Pavol Hluchy (Lopo) <lopo at losys dot eu>

pkgname=squirrelmail-plugin-secure_login
pkgver=1.4
pkgrel=1
_squirrelver=1.2.8
pkgdesc="Plugin for squirrelmail. Automatically enables a secure HTTPS/SSL-encrypted connection for login page if it hasn't already been requested by the referring hyperlink or bookmark"
license=('GPLv2')
arch=(any)
url="http://www.squirrelmail.org/plugin_view.php?id=61"
depends=("squirrelmail>=${_squirrelver}")
source=(http://www.squirrelmail.org/plugins/secure_login-${pkgver}-${_squirrelver}.tar.gz)
md5sums=('e511a8e78beab042b123d468ea7e0df9')

build() {
  # install
  local dstdir=$pkgdir/srv/http/squirrelmail/plugins || return 1
  install -d $dstdir || return 1
  cp -R $srcdir/secure_login $dstdir || return 1
}
