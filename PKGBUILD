# Maintainer: Jakub Klinkovský <lahwaacz@archlinux.org>

_name=ArchLinux
pkgname=mediawiki-extension-${_name,,}
pkgver=1.45.1
_upstream_pkgrel=1
pkgrel=1
pkgdesc='An extension for MediaWiki that adds Arch Linux navigation and style'
arch=(any)
url='https://gitlab.archlinux.org/archlinux/archwiki'
license=(GPL-2.0-or-later)
makedepends=(git)
source=($pkgname::git+https://gitlab.archlinux.org/archlinux/archwiki.git#tag=$pkgver-$_upstream_pkgrel)
b2sums=('b51f60936f26a0c95afaae894a74f911edbf46eb3de3ab95dd02516183270884c892b9244b8538194414c07a78e6ae35c524521e5432049a3930dee09690fa30')

package() {
  install -vdm 755 "$pkgdir"/usr/share/webapps/mediawiki/extensions/
  cp -r $pkgname/extensions/$_name "$pkgdir"/usr/share/webapps/mediawiki/extensions/
}
