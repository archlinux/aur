# Maintainer: jwty <janoosh@catgirls.party>

pkgname=scooper
pkgver=1.3
pkgrel=2
pkgdesc='CGI and FastCGI web interface for litterbox IRC logger'
arch=('x86_64')
url="https://git.causal.agency/${pkgname}/"
license=('GPL3')
depends=('kcgi')
source=("https://git.causal.agency/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
md5sums=('5ae03582a2b591d11f633da66e841c69')

build() {
      cd "${pkgname}-${pkgver}"
      ./configure --prefix=/usr --mandir=/usr/share/man
      make all
}

package() {
      cd "${pkgname}-${pkgver}"
      make DESTDIR="$pkgdir/" install
}
