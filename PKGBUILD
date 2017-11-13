# Maintainer: Willy Micieli <fumseckworld at gmail dot com>
# Contributor: Willy Micieli <fumseckworld at gmail dot com>

pkgname=aphrodite
pkgver=1.0
pkgrel=1
pkgdesc="Manage all server websites from one interface"
arch=('any')
url="https://github.com/fumseck/aphrodite"
license=('GPL3')
depends=('php>=7' 'php-apache' 'apache' 'php-pgsql' 'postgresql' 'sqlite' 'mariadb' 'make' 'git' 'composer' 'php-sqlite' )
source=(http://git.fumseck.eu/cgit/aphrodite/snapshot/$pkgname-$pkgver.tar.gz)
md5sums=('10a9aa2467b2d112a4a83df58f6eca24')

build()
{
  cd $srcdir

  make
}

package()
{
  cd $srcdir
  mv $pkgname-$pkgver $pkgname
  if [ -d "/srv/http/$pkgname" ];then
    sudo -rf "/srv/http/$pkgname"
  fi  
  sudo mv $pkgname /srv/http
}
