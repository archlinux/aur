# Maintainer: deadc0de6 <info@deadc0de.ch>

pkgname=dotdropx
pkgver=0.0.1
pkgrel=1
pkgdesc="Addon script for dotdrop"
arch=('any')
url="https://github.com/jtyers/${pkgname}.git"
license=('MIT')
groups=()
depends=('dotdrop' 'yq')
optdepends=('git: auto-commit and auto-push support')
#makedepends=('')
#source=("git+https://github.com/jtyers/dotdropx.git#tag=v${pkgver}")
source=("git+https://github.com/jtyers/dotdropx.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --abbrev=0 --tags | sed 's/^v//g'
}

package() {
  cd "${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}/dotdropx" "${pkgdir}/usr/bin/${pkgname}"

  # MIT licence, though common, needs custom installation
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

