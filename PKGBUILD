# Maintainer: 
# Contributor: FabioLolix
# Contributor: Alif Uzair bin Abd Rahman <riazufila at gmail dot com>
# Contributor: Cole Thompson <cole dot thompson at gmail dot com>

pkgname=ufw-icon-bar
pkgver=r15.gbf67a93
pkgrel=1
epoch=1
pkgdesc="System tray icon for ufw"
arch=('any')
url="https://github.com/juanmafont/ufwIconbar"
license=('unknown')
depends=('yad' 'ufw')
makedepends=(git)
optdepends=('gufw: Enables gufw to open when icon is clicked')
source=("git+https://github.com/juanmafont/ufwIconbar.git#commit=bf67a93ce02543d4d4472eabd822da495a0de9b1")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/ufwIconbar"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/ufwIconbar"
  install -Dm755 gufw_icon.sh "$pkgdir/usr/bin/gufwicon"
}
