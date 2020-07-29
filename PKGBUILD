# Maintainer: Muhammad Sayuti <muhammad.sayuti94@gmail.com>

pkgname=lightdm-webkit-theme-luminos
_pkgname=luminos
pkgver=0.5.0
pkgrel=1
pkgdesc="Customizable LightDM Webkit Greeter Theme"
arch=('any')
url="https://github.com/linuxaddict89/lightdm-webkit-theme-luminos"
license=('GPLv2')
depends=('lightdm' 'lightdm-webkit2-greeter')
makedepends=('imagemagick' 'nodejs' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxaddict89/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("a311405c0f3ba1e8f4bed844b55fa769")

package()
{
  cd ${pkgdir}
  mkdir -p usr/share/lightdm-webkit/themes
  cd usr/share/lightdm-webkit/themes
  cp -dpr --no-preserve=ownership ${srcdir}/${pkgname}-${pkgver} ${_pkgname}
  msg "Removing .git files"
  cd ${_pkgname}
  rm -rf .git
  rm -f .gitignore
  echo "Removing dev files"
  rm -rf node_modules
  rm -rf tasks
  rm -f package.json
  rm -f yarn.lock
  rm -f PKGBUILD
  rm -f install.sh
}
