#!/bin/bash
# shellcheck disable=SC2034,SC2164
# Maintainer: droserasprout@tuta.io
_pkgname=papirus-dark-kde
pkgname=papirus-dark-kde-git
pkgver=r2.de1a069
pkgrel=1
pkgdesc="Papirus Dark theme for KDE"
depends=('plasma-workspace' 'papirus-icon-theme')
provides=("${_pkgname}")
replaces=('papirus-dark-aurorae-theme-git' 'papirus-dark-color-scheme-git' 'papirus-dark-konsole-colorscheme-git' 'papirus-dark-yakuake-theme-git')
conflicts=("${_pkgname}")
arch=('any')
url="https://github.com/droserasprout/${_pkgname}"
license=('GPL3')
makedepends=('git')
options=('!strip')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
