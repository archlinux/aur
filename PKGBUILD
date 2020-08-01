# Maintainer: NV <nv-01@tutanota.com>
pkgname=facc-git
pkgver=1.0.0
pkgrel=1
pkgdesc="FACC is free and open-source fahrenheit and celsius converter."
arch=(x86_64)
url="https://gitlab.com/nv-01/facc.git"
license=('MIT')
groups=()
depends=()
makedepends=(git make gcc)
optdepends=()
provides=(facc)
source=("git+$url")
md5sums=('SKIP')

package() {
  cd facc
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -rf * ${pkgdir}/opt/${pkgname}
	make PREFIX=/usr DESTDIR="${pkgdir/}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  sudo cp ${srcdir}/facc/facc /usr/local/bin/facc
}
