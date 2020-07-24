# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: NV <nv-01@tutanota.com>
pkgname=doits-git
pkgver=0.3.3
pkgrel=2
pkgdesc="doits is free, open-source note taking and todo application."
arch=(x86_64)
url="https://gitlab.com/nv-01/doits.git"
license=('MIT')
groups=()
depends=()
makedepends=(git make go)
optdepends=()
provides=(doits)
source=("git+$url")
md5sums=('SKIP')

package() {
  cd doits
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -rf * ${pkgdir}/opt/${pkgname}
	make PREFIX=/usr DESTDIR="${pkgdir/}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  sudo cp ${srcdir}/doits/bin/doits-linux /usr/local/bin/doits
  mkdir ~/.config/doits/
  cp ${srcdir}/doits/welcome.md ~/.config/doits/
  cp ${srcdir}/doits/welcome-de.md ~/.config/doits/
}
