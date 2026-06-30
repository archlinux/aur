# Maintainer: Cmd-GZ <newsupergodg@gmail.com>
# Ireozar <ireo@ireo.dev>
# Contributor: Marcin Mielniczuk <marmistrz.dev@zoho.eu>
pkgname=graphwar-git
_pkgname=graphwar
pkgver=r33.1f474e6
pkgrel=3
pkgdesc="Hit your enemies using mathematical functions"
arch=(x86_64 i686)
url="https://github.com/catabriga/graphwar"
license=('GPL-3.0')
depends=('java-runtime>=8')
makedepends=('git' 'java-environment>=8')
source=(
	"git+https://github.com/catabriga/graphwar.git"
	"graphwar.sh"
)
sha256sums=('SKIP'
          '5ef4d4a9272ab3cb51be7231f87031d26868f6398e433328e00cb3f3c139da44')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${_pkgname}
    ./compile.sh
}

package() {
  install -Dm644 "${_pkgname}/graphwar.jar" "${pkgdir}/usr/share/games/graphwar/graphwar.jar"
  install -Dm755 "graphwar.sh" "${pkgdir}/usr/bin/graphwar"
}

