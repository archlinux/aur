# Maintainer: Luke Arms <luke@arms.to>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=ttf-adobe-source-serif-fonts
pkgver=4.004
pkgrel=1
pkgdesc="Serif typeface designed to complement Source Sans"
url="https://adobe-fonts.github.io/source-serif/"
arch=(any)
license=(custom)
provides=("adobe-source-serif-fonts=$pkgver" "adobe-source-serif-pro-fonts=$pkgver")
_relver=${pkgver}R
_tarname=source-serif-$_relver
_oldver=3.001R
_oldname=source-serif-$_oldver
source=("$_tarname.tar.gz::https://github.com/adobe-fonts/source-serif/archive/$_relver.tar.gz"
        "$_oldname.tar.gz::https://github.com/adobe-fonts/source-serif/archive/$_oldver.tar.gz")
sha256sums=('dfb364735699cb830caad534cf7741234804d28e4b6fc5e4736b2401f6131aba'
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
