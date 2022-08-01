# Maintainer: Luke Arms <luke@arms.to>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=ttf-adobe-source-code-pro-fonts
pkgver=2.038ro+1.058it+1.018var
pkgrel=1
pkgdesc="Monospaced font family for user interface and coding environments"
url="https://adobe-fonts.github.io/source-code-pro/"
arch=(any)
license=(custom)
provides=("adobe-source-code-pro-fonts=$pkgver")
_relver=2.038R-ro/1.058R-it/1.018R-VAR
_tarname=source-code-pro-${_relver//\//-}
source=("$_tarname.tar.gz::https://github.com/adobe-fonts/source-code-pro/archive/$_relver.tar.gz")
sha256sums=('d8f879fefd66ecb7291ea2d73984b9c0a97fb499424e58290ba6b81787d0c725')

package() {
  cd $_tarname
  install -Dt "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 TTF/*.ttf VAR/*.ttf
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE.md
}
