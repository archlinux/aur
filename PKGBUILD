# Maintainer:

_newpkg='lazarus-git'
pkgbase='lazarus-svn'
pkgver=1
pkgrel=1
epoch=1
pkgdesc="metapackage - migrate to $_newpkg"
arch=('any')

pkgname=(
  "$pkgbase"
  "$pkgbase-gtk2"
  "$pkgbase-qt5"
)

for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    pkgdesc='metapackage - migrate to $_newpkg${_p#$pkgbase}'
    depends=($_newpkg${_p#$pkgbase})
  }"
done
