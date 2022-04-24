# Maintainer:  Amber <amber@mail.cyborgtrees.com>
# Contributor: Yusuf Aktepe <yusuf@yusufaktepe.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=transset-df
pkgver=6
pkgrel=8
pkgdesc="A patched version of X.Org's transset with added functionality."
arch=('x86_64')
url='https://forchheimer.se/transset-df/'
license=('GPL')
depends=('libxcomposite' 'libxdamage' 'libxrender')
source=("http://forchheimer.se/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4563c8a9883db354c58dcd63f87dd3d076c4a3ed9c55b85e8cb59c9d399fdeee')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 transset-df "${pkgdir}/usr/bin/transset-df"
}
