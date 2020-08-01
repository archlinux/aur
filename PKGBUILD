# Maintainer: NV <nv-01@tutanota.com>
pkgname=getn-git
pkgver=1.0.0
pkgrel=1
pkgdesc="GETN is free and open-source number guessing game."
arch=(x86_64)
url="https://gitlab.com/nv-01/getn.git"
license=('MIT')
groups=()
depends=()
makedepends=(git make gcc)
optdepends=()
provides=(getn)
source=("git+$url")
md5sums=('SKIP')

package() {
  cd getn
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -rf * ${pkgdir}/opt/${pkgname}
	make PREFIX=/usr DESTDIR="${pkgdir/}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  sudo cp ${srcdir}/getn/getn /usr/local/bin/getn
}
