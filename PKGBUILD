# Maintainer: imp0  <jan <(a)> siteworld <(.)> be>
# Contributor: Mattias Giese <mattias.giese@posteo.net>

pkgname=pdk
_ubuntu_release=jammy
pkgver=3.2.0.0
_pkgver="${pkgver}-1${_ubuntu_release}"
pkgrel=1
pkgdesc='Puppet Development Kit bundles tools and helpers to create high quality puppet modules'
arch=('x86_64')
url='https://github.com/puppetlabs/pdk'
options=(staticlibs !strip)
source=("https://apt.puppetlabs.com/pool/${_ubuntu_release}/puppet8/p/pdk/pdk_${_pkgver}_amd64.deb")
sha512sums=('f1bdafa60c762256e28d1daccee95dbf06004b35e9f98f117973d707d1666b1e03c1bf9aedae73012871f7d3b15b0e0f0ecfc5e22e19f9256572b3c14c0c0f8f')
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
