# Maintainer: Muhammad Sayuti <muhammad.sayuti94@gmail.com>

pkgname=lightdm-webkit-theme-luminos-git
_pkgname=luminos
pkgver=1.0.1
pkgrel=1
pkgdesc="Customizable LightDM Webkit Greeter Theme"
arch=('any')
url="https://github.com/linuxaddict89/lightdm-webkit-theme-luminos"
license=('GPLv2')
depends=('lightdm' 'lightdm-webkit2-greeter')
makedepends=('imagemagick' 'nodejs' 'npm' 'git')
source=('git://github.com/linuxaddict89/lightdm-webkit-theme-luminos.git')
provides=('lightdm-webkit-theme-luminos')
conflicts=('lightdm-webkit-theme-luminos')
md5sums=('SKIP')
_gitname="lightdm-webkit-theme-luminos"


package()
{
  cd ${pkgdir}
  mkdir -p usr/share/lightdm-webkit/themes
  cd usr/share/lightdm-webkit/themes
  cp -dpr --no-preserve=ownership ${srcdir}/${_gitname} ${_pkgname}
  msg "Removing .git files"
  cd ${_pkgname}
  rm -rf .git
  rm -f .gitignore
  msg "Removing dev files"
  rm -rf node_modules
  rm -rf tasks
  rm -f package.json
  rm -f yarn.lock
  rm -f PKGBUILD
  rm -f install.sh
}
