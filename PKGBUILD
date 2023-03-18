# Maintainer: imp0  <jan <(a)> siteworld <(.)> be>
# Contributor: Mattias Giese <mattias.giese@posteo.net>

pkgname=pdk
_ubuntu_release=jammy
pkgver=2.7.0.0
_pkgver="${pkgver}-1${_ubuntu_release}"

pkgrel=1
pkgdesc='Puppet Development Kit bundles tools and helpers to create high quality puppet modules'
arch=('x86_64')
url='https://github.com/puppetlabs/pdk'
options=(staticlibs !strip)
source=("https://apt.puppetlabs.com/pool/${_ubuntu_release}/puppet7/p/pdk/pdk_${_pkgver}_amd64.deb")
sha512sums=('b781bfc682cd6cc9e00504fc43045b02e02cd34135637ec59f9336bf8e288c9cacd6b583980d95d592aebdbd161e5fa44ceb09d773807cc46c4a6a9189b326d0')
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
