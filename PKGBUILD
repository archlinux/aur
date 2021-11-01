# Maintainer: Anders Damsgaard <anders@adamsgaard.dk>

pkgname='xml2tsv'
pkgver=0.1
pkgrel=2
pkgdesc='XML to TSV converter'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://git.katolaz.net/xml2tsv/tree/README.md'
_url_source='ftp://bitreich.org/releases/xml2tsv'
license=('ISC')
depends=('glibc')
source=("${_url_source}/${pkgname}-${pkgver}.tar.lz")
sha512sums=('426588e3167a403c3c7a16114811e4a4ef6fdf7da189fe0fb700f067270be020ced62226c93863ef176ac67e7fa04635ca7ff2115748a6a9302933c763427144')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
