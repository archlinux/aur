# Maintainer: skrewball <aur at joickle dot com>

pkgname=gnome-shell-extension-color-picker
_pkgbase=tuberry-color-picker
pkgver=30
_commit=8b9bc6c
pkgrel=1
pkgdesc='Simple color picker for Gnome Shell'
arch=(any)
url='https://github.com/tuberry/color-picker'
license=('GPL3')
depends=('dconf' 'gnome-shell')
source=("${_pkgbase}-${pkgver}.tar.gz::${url}/tarball/${_commit}")
sha256sums=('903d60aa21f5d15a8301d7073d9aa1e280d3ac7e8ef404e6b5ba6ab9da74a4bd')

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
