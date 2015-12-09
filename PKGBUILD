pkgname=tsung
pkgver=1.6.0
pkgrel=1
pkgdesc="Erlang-based open-source multi-protocol distributed load testing tool"
arch=('i686' 'x86_64')
url="http://tsung.erlang-projects.org"
license=('GPL')
depends=('erlang' 'gnuplot' 'perl')
source=("http://tsung.erlang-projects.org/dist/$pkgname-$pkgver.tar.gz")
md5sums=('ecefc861c2e0c1f99da459261559055a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr

}
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
    make DESTDIR="${pkgdir}" install
}