pkgname=typecho
pkgver=1.1
pkgrel=1
_pkgbuild=17.10.30
pkgdesc='A PHP Blogging Platform'
arch=(any)
url='https://typecho.org/'
license=(GPL)
depends=("php>5.1"
	 "php-fpm>5.1"
	 "php-cgi>5.1")
optdepends=('apache: Web server'
	    'nginx: Web server'
            'mariadb: Database server'
	    'sqlite: Database server'
	    'php-sqlite>5.1: PHP extension for sqlite'
	    'postgresql: Database server'
	    'php-pgsql>5.1: PHP extension for postgresql'
           )
source=("https://typecho.org/downloads/${pkgver}-${_pkgbuild}-release.tar.gz")
b2sums=('6c60d52d6eee546ca1ee6c6497ad1e7209e7582a6be4daabcf1667f07258288886c2b63a39f7b6589032a43e9faca329d35fdfc6b6ddb0183ac9f546581520b9')

package() {
  install -Dm 755 "$pkgdir/usr/share/webapps/$pkgname"
  cd "$srcdir"/build
  cp -r * "$pkgdir/usr/share/webapps/$pkgname"
}
