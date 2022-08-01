# Maintainer: Luke Arms <luke@arms.to>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=ttf-adobe-source-sans-fonts
pkgver=3.046
pkgrel=1
pkgdesc="Sans-serif font family for user interface environments"
url="https://adobe-fonts.github.io/source-sans/"
arch=(any)
license=(custom)
provides=("adobe-source-sans-fonts=$pkgver" "adobe-source-sans-pro-fonts=$pkgver")
_relver=${pkgver}R
_tarname=source-sans-$_relver
_oldver=3.006R
_oldname=source-sans-$_oldver
source=("$_tarname.tar.gz::https://github.com/adobe-fonts/source-sans/archive/$_relver.tar.gz"
        "$_oldname.tar.gz::https://github.com/adobe-fonts/source-sans/archive/$_oldver.tar.gz")
sha256sums=('7a0a3a0c9ff2740380eddc28a53b4b0dc99491da5f900f4add5af2d1a18e06bc'
            '45dbc4994892710367e801869d8ad6b26589030977b660f6a968de36147ffd32')

package() {
  # "Source Sans Pro"
  cd $_oldname
  install -Dt "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 TTF/*.ttf VAR/*.ttf
  cd ..

  # "Source Sans 3"
  cd $_tarname
  install -Dt "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 TTF/*.ttf VAR/*.ttf
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE.md
}
