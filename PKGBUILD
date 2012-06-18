# Contributor: Idares <idares@seznam.cz>

pkgname=nagios-nrpe-plugin
pkgver=2.13
pkgrel=1
pkgdesc="The Nagios NRPE server side plugin."
license=('GPL')
arch=('i686' 'x86_64')
url="http://www.nagios.org"
source=("http://downloads.sourceforge.net/nagios/nrpe-$pkgver.tar.gz")
md5sums=('e5176d9b258123ce9cf5872e33a77c1a')
depends=(nagios)

build() {
    cd $startdir/src/nrpe-$pkgver
    ./configure --prefix=/usr/share/nagios \
        --with-nagios-user=nobody --with-nagios-group=nobody || return 1
    make || return 1
    make prefix=$startdir/pkg/usr/share/nagios install-plugin || return 1
}
