# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=wikiquote-fortune
pkgver=1.4
pkgrel=2
pkgdesc="Generate fortune cookies from Wikiquote"
arch=('any')
url="https://github.com/maandree/wikiquote-fortune"
license=('GPL3')
depends=('python' 'wget')
makedepends=('coreutils')
source=(https://github.com/maandree/wikiquote-fortune/archive/${pkgver}.tar.gz)
sha256sums=(d4aec7f278c3ceff6effc19cdb31472dab7efc26de90d7d7e62f9009fb2aa382)


package() {
  cd "${srcdir}/wikiquote-fortune-${pkgver}"
  
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE COPYING "${pkgdir}/usr/share/licenses/${pkgname}"
  
  mkdir -p "${pkgdir}/usr/share/doc"
  install -m644 README "${pkgdir}/usr/share/doc/${pkgname}"
  
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 wikiquote-fortune "${pkgdir}/usr/bin"
}

