# Maintainer: imp0  <jan <(a)> siteworld <(.)> be>
# Contributor: Mattias Giese <mattias.giese@posteo.net>

pkgname=pdk
_ubuntu_release=noble
pkgver=3.4.0.1
_pkgver="${pkgver}-1${_ubuntu_release}"
pkgrel=1
pkgdesc='Puppet Development Kit bundles tools and helpers to create high quality puppet modules'
arch=('x86_64')
url='https://github.com/puppetlabs/pdk'
options=(staticlibs !strip)
source=("https://apt.puppetlabs.com/pool/${_ubuntu_release}/puppet8/p/pdk/pdk_${_pkgver}_amd64.deb")
sha512sums=('19e8e7d679e3352dcafbd3dd49117ebb749d2fe329d41fa8c323107fd45a053edf27b8735526ffaffc43a719c6376771a67783db87e81ac5669cca4aaf335266')
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
