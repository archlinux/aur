# Maintainer: superlex

# Based on arch-firefox-search:
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=arch-firefox-forumsearch-it
pkgver=0.1
pkgrel=3
pkgdesc="Firefox search engines for Arch Linux Italian forum"
arch=('any')
url="http://www.archlinux.it/forum/"
license=('GPL')
depends=("firefox")
source=(arch-forum-a-it.xml
	arch-forum-c-it.xml)
md5sums=('22afcceb949a93e52e4e355877496a03'
         '4ac4b6067980728d39997d2878dc8b58')

package() {
#  _ffver=`pacman -Q firefox | cut -f2 -d\ | cut -f1 -d-`
#  depends=("firefox>=${_ffver}" "firefox<=${_ffver/0/99}")

  cd "${srcdir}"
  local _prefix="${pkgdir}"/usr/lib/firefox/browser/searchplugins

  for i in ${source[@]}; do
    install -D -m 0644 "${srcdir}"/$i ${_prefix}/$i
  done
}
