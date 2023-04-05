# Maintainer: Luke Arms <luke@arms.to>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=ttf-adobe-source-serif-fonts
pkgver=4.005
pkgrel=1
pkgdesc="Serif typeface designed to complement Source Sans"
url="https://adobe-fonts.github.io/source-serif/"
arch=(any)
license=(custom)
provides=("adobe-source-serif-fonts=$pkgver" "adobe-source-serif-pro-fonts=$pkgver")
_relver=4.005R
_tarname=source-serif-$_relver
_oldver=3.001R
_oldname=source-serif-$_oldver
source=("$_tarname.tar.gz::https://github.com/adobe-fonts/source-serif/archive/$_relver.tar.gz"
        "$_oldname.tar.gz::https://github.com/adobe-fonts/source-serif/archive/$_oldver.tar.gz")
sha256sums=('92415a067bfa449876cd3f4a4229d18a9140588574299696da81be0e213d69df'
            '6be29a6ecc275d39f77d608fba576ee1976287f65823bde61309dc907023410c')

package() {
  # "Source Serif Pro"
  cd $_oldname
  install -Dt "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 TTF/*.ttf VAR/*.ttf
  cd ..

  # "Source Serif 4"
  cd $_tarname
  install -Dt "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 TTF/*.ttf VAR/*.ttf
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE.md
}
