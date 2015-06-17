# Contributor: Pavol Hluchy (Lopo) <lopo at losys dot eu>

_plugin=add_address
pkgname=squirrelmail-plugin-${_plugin}
pkgver=1.0.3
pkgrel=1
_squirrelver=1.4.0
pkgdesc='Plugin for squirrelmail. Helps users add addresses to their address book from incoming and outgoing messages quickly and easily.'
license=('GPLv2')
arch=(any)
url='http://www.squirrelmail.org/plugin_view.php?id=269'
depends=('squirrelmail>=1.4.10')
source=("http://www.squirrelmail.org/plugins/${_plugin}-${pkgver}-${_squirrelver}.tar.gz")
md5sums=('e922dbad293ac0941a36eb0e543faa20')

build() {
  # install
  local dstdir=$pkgdir/srv/http/squirrelmail/plugins || return 1
  install -d $dstdir || return 1
  cp -R $srcdir/${_plugin} $dstdir || return 1
}
