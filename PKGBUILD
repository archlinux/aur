# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
_pkgname=steam-cli
pkgname=${_pkgname}-git
pkgver=0.r27.b7583dc
pkgrel=1
pkgdesc=''
arch=('any')
url='https://github.com/berenm/steam-cli'
license=('Unlicense')
depends=('bash' 'steam' 'jq' 'expect' 'libsecret')
makedepends=('git')
optdepends=('wine')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -Dm755 bin/steam-cli "${pkgdir}/usr/bin/steam-cli"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${_pkgname}/README.rst"
  install -Dm644 UNLICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/UNLICENSE"
}
