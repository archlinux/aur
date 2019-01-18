# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Olivier Biesmans <o.archlinux@biesmans.fr>

pkgname=certigo
pkgver=1.11.0
pkgrel=1
pkgdesc='A utility to examine and validate certificates in a variety of formats'
arch=('x86_64' 'i686')
url='https://github.com/square/certigo'
license=('MIT')
makedepends=('go-pie' 'git')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/square/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2a0e7291c921f9e662743183d0a0695d7b34efb9972cda7f80cf3f9a292bcda0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
