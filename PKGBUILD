# Maintainer: Marc Rechté <marc4@rechte.fr>
pkgname='pg_filedump'
pkgver='14.1'
pkgrel=1
pkgdesc='Display formatted contents of a PostgreSQL heap, index, or control file.'
arch=('x86_64')
url='https://github.com/df7cb/pg_filedump'
license=('GPL')
#depends=('lz4' 'libpq_pgport')
#source=("git+https://github.com/df7cb/pg_filedump.git#REL_${pkgver//./_}")
source=("https://github.com/df7cb/pg_filedump/archive/refs/tags/REL_${pkgver//./_}.tar.gz")
md5sums=('1b40a746732d5916ca06b53972011a23')

build() {
    cd "$pkgname-REL_${pkgver//./_}"
    make
}

package() {
    cd "$pkgname-REL_${pkgver//./_}"
    make DESTDIR="$pkgdir/" install
}
