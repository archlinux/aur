# Maintainer Robert Booster > boosterdev@linuxmail.org
# Automatic builder > https://github.com/boosterdev/autobuild

pkgname="zuki-themes"
_gitver="v3.22-2"
pkgver="3.22.2"
pkgrel=1
pkgdesc="A selection of themes for GNOME, Xfce and more (includes Zukitwo and Zukitre)."
arch=('any')
url="https://github.com/lassekongo83/zuki-themes"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'ttf-roboto')
makedepends=('git')
source=("${pkgname}::git+$url#tag=${_gitver}")
md5sums=('SKIP')

package() {
  install -d -m755 "$pkgdir"/usr/share/{themes,licenses/$pkgname}
  cd "$pkgname"
  cp -rp Zuki* "$pkgdir"/usr/share/themes
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/
}
