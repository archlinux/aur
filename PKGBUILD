# Maintainer: jwty <janoosh@catgirls.party>

pkgname=litterbox
pkgver=1.8
pkgrel=2
pkgdesc='TLS-only IRC logger storing events in SQLite database'
arch=('x86_64')
url="https://git.causal.agency/${pkgname}/"
license=('GPL3')
depends=('libretls' 'sqlite')
source=("https://git.causal.agency/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
md5sums=('6971643f5e23a0b6e7d14189fe99080f')

build() {
      cd "${pkgname}-${pkgver}"
      ./configure --prefix=/usr --mandir=/usr/share/man
      make all
}

package() {
      cd "${pkgname}-${pkgver}"
      make DESTDIR="$pkgdir/" install
}
