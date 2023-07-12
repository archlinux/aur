# Maintainer: imp0  <jan <(a)> siteworld <(.)> be>
# Contributor: Mattias Giese <mattias.giese@posteo.net>

pkgname=pdk
_ubuntu_release=jammy
pkgver=3.0.0.0
_pkgver="${pkgver}-1${_ubuntu_release}"
pkgrel=1
pkgdesc='Puppet Development Kit bundles tools and helpers to create high quality puppet modules'
arch=('x86_64')
url='https://github.com/puppetlabs/pdk'
options=(staticlibs !strip)
source=("https://apt.puppetlabs.com/pool/${_ubuntu_release}/puppet8/p/pdk/pdk_${_pkgver}_amd64.deb")
sha512sums=('3ad3a613e5227e39ee8460b906a346a2b21c87b7a5173a511d5d89c243159110f9e4ec3d9e903fb27c5737a9e65f9e0af836dda02cc3225a0ab6eeeb400761f1')
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
