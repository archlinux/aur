# Maintainer: Luke Arms <luke@arms.to>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=ttf-adobe-source-code-pro-fonts
pkgver=2.040u+1.060i+1.024vf
pkgrel=1
pkgdesc="Monospaced font family for user interface and coding environments"
url="https://adobe-fonts.github.io/source-code-pro/"
arch=(any)
license=(custom)
provides=("adobe-source-code-pro-fonts=$pkgver")
_relver=2.040R-u/1.060R-i/1.024R-vf
_tarname=source-code-pro-${_relver//\//-}
source=("$_tarname.tar.gz::https://github.com/adobe-fonts/source-code-pro/archive/$_relver.tar.gz")
sha256sums=('f17728d68dc1b0720f503d990f763738b6647d10d5cd63afa4525754f2c04229')

package() {
  cd $_tarname
  install -Dt "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 TTF/*.ttf VAR/*.ttf
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE.md
}
