# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=transset-df
pkgver=6
pkgrel=6
pkgdesc="A patched version of X.Org's transset with added functionality."
arch=('x86_64')
url='https://forchheimer.se/transset-df/'
license=('GPL')
depends=('libxcomposite' 'libxdamage' 'libxrender')
source=("https://forchheimer.se/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('3375d570adc9d875d7fc476d1a50d5a5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 transset-df "${pkgdir}/usr/bin/transset-df"
}
