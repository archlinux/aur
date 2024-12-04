# maintainer: Guoyi Zhang <myname at malacology dot net>
pkgname=ojs
pkgver=3.4.0_8
pkgrel=0
pkgdesc='Open Journal System'
arch=(any)
url='https://pkp.sfu.ca/software/ojs/'
license=('MIT')
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
source=("https://pkp.sfu.ca/ojs/download/ojs-${pkgver//_/-}.tar.gz")
b2sums=('63fad7919d28b31cc4a82031826ea514a326cc86925121832c8c32e1d35614ec2cf728b68fc932a716fc6ff1de6508d8db77ada2806c6f4516cd3e76f2ca32e7')

package() {
  mkdir -p "$pkgdir/usr/share/webapps/$pkgname"
  cd "$srcdir"/"$pkgname"-"${pkgver//_/-}"
  cp -r * "$pkgdir/usr/share/webapps/$pkgname"
}
