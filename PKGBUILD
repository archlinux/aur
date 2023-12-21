# Maintainer: imp0  <jan <(a)> siteworld <(.)> be>
# Contributor: Mattias Giese <mattias.giese@posteo.net>

pkgname=pdk
_ubuntu_release=jammy
pkgver=3.0.1.3
_pkgver="${pkgver}-1${_ubuntu_release}"
pkgrel=1
pkgdesc='Puppet Development Kit bundles tools and helpers to create high quality puppet modules'
arch=('x86_64')
url='https://github.com/puppetlabs/pdk'
options=(staticlibs !strip)
source=("https://apt.puppetlabs.com/pool/${_ubuntu_release}/puppet8/p/pdk/pdk_${_pkgver}_amd64.deb")
sha512sums=('3a5a0e5ff0fb15106ab570cd05bb5e42ab16b96882d89cc8bfec52776d3555e90abb7d0e084a396d7da051e935976066f41ddd955661843875158aa053262d12')
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
