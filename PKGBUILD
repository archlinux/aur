# Maintainer: Jose Riha <jose1711 gmail com>

_pkgname=markiza_cli
pkgname=${_pkgname}-git
pkgver=r4.c15b871
pkgrel=1
pkgdesc="Play live streams from Markiza TV using mpv"
arch=('any')
url="https://github.com/jose1711/markiza_cli"
license=('GPL')
depends=('wget' 'mpv')
conflicts=(${pkgname})
provides=(${pkgname})
source=("git+https://github.com/jose1711/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/$_pkgname"
  install -Dm755 markiza_cli "${pkgdir}/usr/bin/markiza_cli" 
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
