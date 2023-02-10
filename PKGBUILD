pkgname=typecho
pkgver=1.2.0
pkgrel=2
pkgdesc='A PHP Blogging Platform'
arch=(any)
url='https://typecho.org/'
license=(GPL)
install="$pkgname.install"
depends=("php"
	 "php-fpm"
	 "php-cgi")
optdepends=('apache: Web server'
	    'nginx: Web server'
            'mariadb: Database server'
	    'sqlite: Database server'
	    'php-sqlite: PHP extension for sqlite'
	    'postgresql: Database server'
	    'php-pgsql: PHP extension for postgresql'
           )
source=("https://github.com/typecho/typecho/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('b711f50511f60ab228c880f57bc848c678b58a56e3d9b2f037d27308ca75d8212fc14fb1292646048bbe8afb0fc99edb7bf06f8a5386f72d29a8e2a4d59bed32')

package() {
  mkdir -p "$pkgdir/usr/share/webapps/$pkgname/usr/uploads"
  cd "$srcdir"/typecho-${pkgver}
  cp -r * "$pkgdir/usr/share/webapps/$pkgname"
}
