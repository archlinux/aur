# Maintainer: imp0  <jan <(a)> siteworld <(.)> be>
# Contributor: Mattias Giese <mattias.giese@posteo.net>

pkgname=pdk
_ubuntu_release=jammy
pkgver=2.7.1.0
_pkgver="${pkgver}-1${_ubuntu_release}"

pkgrel=1
pkgdesc='Puppet Development Kit bundles tools and helpers to create high quality puppet modules'
arch=('x86_64')
url='https://github.com/puppetlabs/pdk'
options=(staticlibs !strip)
source=("https://apt.puppetlabs.com/pool/${_ubuntu_release}/puppet7/p/pdk/pdk_${_pkgver}_amd64.deb")
sha512sums=('ac5b6b658f01d09f6afdf062e0b72bde55837d0e0138a4b4a2ec3a47fb0ae5a1b2066456c6c0267bb980c70dadd1c5eec9ec313bed8c219decb4ae2fbb25c22f')
depends=(libxcrypt-compat)

package() {
  tar xzf data.tar.gz

  mv usr "${pkgdir}"
  mv opt "${pkgdir}"

  cd "${pkgdir}"
  install -d -m 755 usr/bin
  mv usr/local/bin/pdk usr/bin
  rm -rf usr/local
}
