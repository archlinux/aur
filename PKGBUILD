# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=nyble
pkgver=0.5.0
pkgrel=1
pkgdesc="A snake game for the terminal"
arch=('x86_64')
url="https://octobanana.com/software/nyble"
license=('MIT')
source=("https://github.com/octobanana/${pkgname}/archive/${pkgver}.tar.gz")
makedepends=('boost' 'cmake')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
sha256sums=('c05b842fa7cae9def06e6916690e12be249ad584d195c3fdc1f56d44bb87a47e')

build() {
  cd "${pkgname}-${pkgver}"
  cmake . -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "doc/help.txt" "${pkgdir}/usr/share/doc/${pkgname}/help.txt"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}