# Maintainer: Azael Reyes <azael.devel@gmail.com>

pkgname=octetos-db-abstract
pkgver=0.7.0
phase=alpha
pkgrel=1
pkgdesc="API to access database, abstract component."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-db-abstract"
depends=('octetos-core')
#backup=('etc/nanorc')
md5sums=('c642a221336efa971845834febdf3c5d')
source=(https://github.com/azaeldevel/${pkgname}/archive/${pkgver}-${phase}.tar.gz)

build() 
{
    cd ${pkgname}-${pkgver}-${phase}
    autoreconf -fi
    ./configure --with-archlinux --with-mediumword --prefix=/usr --sysconfdir=/etc
    make
}

package() 
{
  cd ${pkgname}-${pkgver}-${phase}
  make DESTDIR="${pkgdir}" install
}
