# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=nap
_prname=nap
pkgver=0.2.4
pkgrel=2
pkgdesc='sleep with a progressbar'
arch=('i686' 'x86_64')
url='https://github.com/Kwpolska/nap'
license=('BSD')
depends=()
makedepends=('make')
options=(!emptydirs)
source=("https://github.com/Kwpolska/${_prname}/releases/download/v${pkgver}/${_prname}-${pkgver}.tar.gz")
md5sums=('d997387682b37f9263125a9b3586b131')

build() {
  cd "${srcdir}/${_prname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_prname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
