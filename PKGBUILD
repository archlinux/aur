# Maintainer: jwty <janoosh@catgirls.party>

pkgname=scooper
pkgver=1.2
pkgrel=1
pkgdesc='CGI and FastCGI web interface for litterbox IRC logger'
arch=('x86_64')
url="https://git.causal.agency/${pkgname}/"
license=('GPL3')
depends=('kcgi' 'sqlite')
source=("https://git.causal.agency/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
md5sums=('83248500b308757465ff795ebfa1f644')

build() {
      cd "${pkgname}-${pkgver}"
      ./configure --prefix=/usr
      make all
}

package() {
      cd "${pkgname}-${pkgver}"
      make DESTDIR="$pkgdir/" install
}
