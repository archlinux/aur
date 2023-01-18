# Maintainer: imp0  <jan <(a)> siteworld <(.)> be>
# Contributor: Mattias Giese <mattias.giese@posteo.net>

pkgname=pdk
# https://puppet-pdk.s3.amazonaws.com/pdk/1.7.1.0/repos/deb/xenial/PC1/pdk_1.7.1.0-1xenial_amd64.deb
_ubuntu_release=focal
pkgver=2.6.0.0
_pkgver="${pkgver}-1${_ubuntu_release}"

pkgrel=1
pkgdesc='Puppet Development Kit bundles tools and helpers to create high quality puppet modules'
arch=('x86_64')
url='https://github.com/puppetlabs/pdk'
options=(staticlibs !strip)
source=("http://apt.puppetlabs.com/pool/${_ubuntu_release}/puppet7/p/pdk/pdk_${_pkgver}_amd64.deb")
sha256sums=('52d7aaee707a0e256591934c7359b02e2f40dd0216065d77c04f1c7577216f8f')
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
