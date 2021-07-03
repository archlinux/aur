# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
pkgname=siji
pkgver=2021.07.03
pkgrel=1
pkgdesc='Iconic bitmap font based on stlarch with additional glyphs'
arch=('any')
url="https://github.com/The-Repo-Club/siji"
license=('GPLv2')
depends=('fontconfig' 'xorg-mkfontscale' 'xorg-xset')
optdepends=('xorg-xfd: use view.sh script to view glyphs')
makedepends=('git')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
install=$pkgname.install
sha256sums=('30bea6300124e7289f5a67bb73901c8ef7d644ee346887e2675b8877928efa57')

package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  install -D -m644 bdf/siji.bdf "${pkgdir}/usr/share/fonts/misc/siji.bdf"
  install -D -m644 ttf/siji.ttf "${pkgdir}/usr/share/fonts/misc/siji.ttf"
  install -D -m755 view.sh "${pkgdir}/usr/share/${_pkgname}/view.sh"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
