# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=timeline
pkgver=1.1
pkgrel=1
pkgdesc="A plain-text based distributed social network build on top of git configuration manager"
arch=('any')
url="https://ajdiaz.me/timeline/"
license=('GPLv3')
depends=('bash' 'git')
source=("https://github.com/ajdiaz/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0c80e3b045eff71478a4d7bfec4d064411cd2d16f3353ac90df68e4c5a3d1d29')

build() {
  cd "${pkgname}-${pkgver}"
  make clean && make
}

package() {
  cd "${pkgname}-${pkgver}"

  # binary
  install -D -m755 "tl" "${pkgdir}/usr/bin/tl"  

  # docs
  install -D -m644 README "${pkgdir}/usr/share/doc/${_pkgname}/README"
}
