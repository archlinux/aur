# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=auto-auto-complete
pkgver=7.2
pkgrel=1
pkgdesc='Autogenerate shell auto-completion scripts'
arch=('any')
url='https://github.com/maandree/auto-auto-complete'
license=('GPL3')
depends=('python3')
makedepends=('make' 'sed' 'coreutils' 'python3' 'texinfo')
install=auto-auto-complete.install
source=(https://github.com/maandree/auto-auto-complete/archive/$pkgver.tar.gz)
sha256sums=(5e54025c6ef65dfff5ba976d23eb778a0936b0678763ebcd78359d460300301e)


build() {
  cd "auto-auto-complete-${pkgver}"
  make
}

package() {
  cd "auto-auto-complete-${pkgver}"
  make DESTDIR="$pkgdir" install
}

