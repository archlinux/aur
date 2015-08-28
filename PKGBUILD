pkgname=pg-bsd-indent
pkgver=1.3
_majorver=${pkgver%.*}
pkgrel=1
pkgdesc="BSD indent (patched for postgresql)"
arch=('i686' 'x86_64')
url="http://www.postgresql.org/"
license=('custom:PostgreSQL')
conflicts=('indent')
source=(ftp://ftp.postgresql.org/pub/dev/pg_bsd_indent-${pkgver}.tar.gz
       )
md5sums=('eab7754395c491a8205bfc21765b9709'
        )
sha256sums=('f827b3cd7f36ab723bfdbacb46b9a9cac8cd2d8a2ed8a559a1b45bee6ab2f352'
           )

build() {
  cd "${srcdir}/pg_bsd_indent"
  make
}

package() {
  mkdir -p "${pkgdir}/usr/local/bin"
  cd "${srcdir}/pg_bsd_indent"
  install -m755 pg_bsd_indent "${pkgdir}/usr/local/bin/pg_bsd_indent"
}
