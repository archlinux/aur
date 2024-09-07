# Maintainer: KSPAtlas <kspatlas ? disroot _ org>
_pkgname=nufetch
pkgname=${_pkgname}-git
pkgver=r9.df14258
pkgrel=3
pkgdesc='Simple nu+figlet based fetch'
url='https://codeberg.org/KSPAtlas/nufetch'
source=("git+https://codeberg.org/KSPAtlas/nufetch")
arch=('any')
license=('0BSD')
depends=('git' 'nushell>=0.97.1' 'figlet')
sha256sums=('SKIP')
conflicts=('nufetch')
provides=('nufetch')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 nufetch.nu "${pkgdir}/usr/bin/nufetch"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/0BSD.txt"
}
