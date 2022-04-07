# Maintainer: skrewball <jason at joickle dot com>

pkgname=gnome-shell-extension-color-picker
_pkgbase=tuberry-color-picker
pkgver=29
_commit=f78fe63
pkgrel=1
pkgdesc='Simple color picker for Gnome Shell'
arch=(any)
url='https://github.com/tuberry/color-picker'
license=('GPL3')
depends=('dconf' 'gnome-shell>=1:42')
source=("${_pkgbase}-${pkgver}.tar.gz::${url}/tarball/${_commit}")
sha256sums=('42d4976330307d7b123a5d03345583b760c04466d9af074a279d0576239150dd')

build() {
  cd "${_pkgbase}-${_commit}"
  # The envvar LANG is used to localize pot file.
  make LANG=${LANG} mergepo \
    && make VERSION="${pkgver}"
}

package() {
  cd "${_pkgbase}-${_commit}"
  make DESTDIR="${pkgdir}" install
}
