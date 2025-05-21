# Maintainer: jwty <janoosh@catgirls.party>

pkgname=litterbox
pkgver=1.9
pkgrel=1
pkgdesc='TLS-only IRC logger storing events in SQLite database'
arch=('x86_64')
url="https://git.causal.agency/${pkgname}/"
license=('GPL3')
depends=('libretls' 'sqlite')
source=("https://git.causal.agency/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
md5sums=('26aa2cbca050de549f94634bd54552c4')

build() {
      cd "${pkgname}-${pkgver}"
      ./configure --prefix=/usr --mandir=/usr/share/man
      make all
}

package() {
      cd "${pkgname}-${pkgver}"
      make DESTDIR="$pkgdir/" install
}
