# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=timeline
pkgver=1.0
pkgrel=1
pkgdesc="A plain-text based distributed social network build on top of git configuration manager"
arch=('any')
url="https://ajdiaz.me/timeline/"
license=('GPLv3')
depends=('bash' 'git')
source=("https://github.com/ajdiaz/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f5f6fe025b97fa68a5ebf878093e4fcc524a2a17b5d1204de7a857accacb50b7')

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
