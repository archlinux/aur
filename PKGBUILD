# Maintainer: Luke Arms <luke@arms.to>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=ttf-adobe-source-code-pro-fonts
pkgver=2.042u+1.062i+1.026vf
pkgrel=1
pkgdesc="Monospaced font family for user interface and coding environments"
url="https://adobe-fonts.github.io/source-code-pro/"
arch=(any)
license=(custom)
provides=("adobe-source-code-pro-fonts=$pkgver")
_relver=2.042R-u/1.062R-i/1.026R-vf
_tarname=source-code-pro-${_relver//\//-}
source=("$_tarname.tar.gz::https://github.com/adobe-fonts/source-code-pro/archive/$_relver.tar.gz")
sha256sums=('19d2c07eff0d91927c47a482c38e591ba855664fc65440006fb65d0157841249')

package() {
  cd $_tarname
  install -Dt "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 TTF/*.ttf VF/*.ttf
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE.md
}
