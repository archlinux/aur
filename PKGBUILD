# Maintainer: Adolfo silerio
# Maintainer: Francisco Javier Ospina <francisco.ospina@gmail.com>

pkgname=oranchelo-icon-theme-git
_gitname=oranchelo-icon-theme
pkgver=v0.7.0
pkgrel=1
pkgdesc='Oranchelo is a flat-design icon theme for XFCE4 based on Super Flat Remix and inspired by "Corny icons" by Patryk Goworowski.'
arch=(any)
depends=('git')
makedepends=('git')
url='https://github.com/Madh93/oranchelo-icon-theme.git'
license=('GPL3')
groups=('gnome' 'xfce')
conflicts=('oranchelo-icon-theme') 
provides=('oranchelo-icon-theme')
source=('git+https://github.com/Madh93/oranchelo-icon-theme.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  TAG=$(git describe --tags)
  echo $TAG | cut -d"-" -f 1
}

package() {

  install -d -m 755 "${pkgdir}/usr/share/icons/Oranchelo"
  install -d -m 755 "${pkgdir}/usr/share/icons/Oranchelo-Green"
  

  cd "${srcdir}/${_gitname}/Oranchelo"
  cp -r . "${pkgdir}/usr/share/icons/Oranchelo/"
  cd "${srcdir}/${_gitname}/Oranchelo-Green"
  cp -r . "${pkgdir}/usr/share/icons/Oranchelo-Green/"
}
