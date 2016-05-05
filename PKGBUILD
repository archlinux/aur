# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=conky-manager
pkgver=2.4
_ubuntu=~136~ubuntu16.04.1
pkgrel=2
pkgdesc="GUI for managing Conky config files with options to browse and edit themes"
url="https://launchpad.net/conky-manager"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('cairo' 'conky' 'desktop-file-utils' 'gtk3' 'imagemagick' 'json-glib' 'libgee' 'p7zip' 'rsync')
makedepends=('vala')
options=('!emptydirs')
source=(${pkgname}-${pkgver}-${_ubuntu}.tar.xz::https://launchpad.net/~teejee2008/+archive/ubuntu/ppa/+files/${pkgname}_${pkgver}${_ubuntu}.tar.xz
        makefile-roundup.patch)
sha512sums=('777ef3e627212f65b96e7bc5cf959912de9f6c2e03d4582d597cbf64b202a23f8311b6d56f57e411ff84df8e5600e2c5b1a7d15aa5dc6fd834beb4ff4bb493cb'
            '3ce1bdcabfd9ee4713ed45a5d7b0dd913b69a0623f96c3aa4a49737ee685330aa7b4a9a369f7e4bd584e41d7eacbbaa9be6fff36db39186026c73bfb672ffc25')

prepare() {
  cd ${pkgname}-${pkgver}${_ubuntu}
  patch -Np0 < "${srcdir}/makefile-roundup.patch"
}

build() {
  cd ${pkgname}-${pkgver}${_ubuntu}
  make
}

package() {
  cd ${pkgname}-${pkgver}${_ubuntu}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
