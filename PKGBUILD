# Maintainer: Willy Micieli <fumseckworld at gmail dot com>
# Contributor: Willy Micieli <fumseckworld at gmail dot com>

pkgname=aphrodite
pkgver=1.7
pkgrel=2
pkgdesc="Manage all server websites from one interface"
arch=('any')
url="https://github.com/fumseck/aphrodite"
license=('GPL3')
depends=('php>=7' 'sudo' 'php-apache' 'apache' 'php-pgsql' 'postgresql' 'sqlite' 'mariadb' 'make' 'git' 'composer' 'php-sqlite')
build()
{
	composer create-project imperium/aphrodite $pkgname $pkgver 
 
}

package()
{
    cd $srcdir

	if [ -d "/srv/http/$pkgname" ];then
		sudo rm -rf "/srv/http/$pkgname"
	fi
	sudo mv $pkgname /srv/http
    
}
