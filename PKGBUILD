# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

pkgname=arcpp
pkgver=0.13.2
pkgrel=1
pkgdesc="An implementation of the Arc programming language."
arch=('x86_64' 'i686')
url="https://github.com/kimtg/Arcpp"
license=('Apache')
depends=('readline')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/kimtg/${pkgname}/archive/v${pkgver}.zip")
sha256sums=('bff813b49e801f6eed8dac6ba76b8dcddc1d98385cbd1134aa426d407a06f74c')

build() {
  cd ${pkgname/a/A}-${pkgver}
  make readline
}

package() {
  cd ${pkgname/a/A}-${pkgver}
  install -Dm755 "arc++" "${pkgdir}/usr/bin/arc++"
}

# vim:set ts=2 sw=2 et:
