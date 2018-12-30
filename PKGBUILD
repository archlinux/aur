# Maintainer: Salo Shp <support@salosh.org>
pkgname=nudnik
pkgver=0.0.24
pkgrel=1
epoch=
pkgdesc="gRPC load-balancing testing tool"
arch=(any)
url="https://github.com/salosh/nudnik.git"
license=(GPLv3)
groups=()
depends=()
makedepends=("python" "python-pip")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
md5sums=()
validpgpkeys=()

build() {
  pip install --no-deps --target="nudnik" nudnik==0.0.24
}

package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r $srcdir/nudnik/* $pkgdir/"$sitepackages"
}
