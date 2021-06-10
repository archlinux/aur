# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: João Vitor S. Anjos <jvanjos at protonmail dot com>
# Contributor: Sebastien Duquette <ekse.0x@gmail.com>

pkgname=dnsmap
pkgver=0.36
pkgrel=1
pkgdesc='Passive DNS network mapper'
url='https://github.com/resurrecting-open-source-projects/dnsmap'
arch=('i686' 'x86_64')
depends=('bash')
makedepends=('autoconf' 'automake')
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f52d6d49cbf9a60f601c919f99457f108d51ecd011c63e669d58f38d50ad853c')
sha512sums=('60f0602314ea6f2b8c16bda1d1d47110c4b2a16f32174882e4406b4ccece39001527337f6ba40da65524287d005c1611e4c14e6a1ec99b25e50f4a20c7e6577f')

build() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm 644 COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}
}

# vim: ts=2 sw=2 et:
