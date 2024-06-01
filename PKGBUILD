# Maintainer: imp0  <jan <(a)> siteworld <(.)> be>
# Contributor: Mattias Giese <mattias.giese@posteo.net>

pkgname=pdk
_ubuntu_release=jammy
pkgver=3.2.0.1
_pkgver="${pkgver}-1${_ubuntu_release}"
pkgrel=1
pkgdesc='Puppet Development Kit bundles tools and helpers to create high quality puppet modules'
arch=('x86_64')
url='https://github.com/puppetlabs/pdk'
options=(staticlibs !strip)
source=("https://apt.puppetlabs.com/pool/${_ubuntu_release}/puppet8/p/pdk/pdk_${_pkgver}_amd64.deb")
sha512sums=('4c4874225d81f05c28bcf8d69a1c4079a46676ca670b7104b53f28a384951d9be3513c494ada0f84fb5bfda63e753f0d5857ed505ecc95442d570d71cd817723')
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
