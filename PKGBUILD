# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=python-pack-git
_pkgname=python-pack-git
pkgver=r48.fd779b2
pkgrel=1
pkgdesc="Password Analysis and Cracking Kit(python3 fork)"
arch=('any')
url="https://github.com/Hydraze/pack"
license=('BSD')
groups=()
depends=('python' 'python-pyenchant')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/Hydraze/pack.git")
noextract=()
sha256sums=('SKIP')


pkgver() {
  cd "$srcdir/${_pkgname}"
# Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#build() {
#	cd "$srcdir/${pkgname%-VCS}"
#	./autogen.sh
#	./configure --prefix=/usr
#	make
#}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm755 maskgen.py "${pkgdir}/usr/bin/maskgen.py"
  install -Dm755 policygen.py "${pkgdir}/usr/bin/policygen.py"
  install -Dm755 rulegen.py "${pkgdir}/usr/bin/rulegen.py"
  install -Dm755 statsgen.py "${pkgdir}/usr/bin/statsgen.py"
  install -Dm644 README "${pkgdir}/usr/share/${pkgname}/doc/README"
}
