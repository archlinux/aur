# Maintainer: Mattias Giese <mattias.giese@posteo.net>

pkgname=pdk
# https://puppet-pdk.s3.amazonaws.com/pdk/1.7.1.0/repos/deb/xenial/PC1/pdk_1.7.1.0-1xenial_amd64.deb
_ubuntu_release=focal
pkgver=2.2.0.0
_pkgver="${pkgver}-1${_ubuntu_release}"

pkgrel=1
pkgdesc='Puppet Development Kit bundles tools and helpers to create high quality puppet modules'
arch=('x86_64')
url='https://github.com/puppetlabs/pdk'
options=(staticlibs !strip)
source=("http://apt.puppetlabs.com/pool/${_ubuntu_release}/puppet7/p/pdk/pdk_${_pkgver}_amd64.deb")
sha512sums=('6be22d03929940bdc6e4b2f7891e8e73c2d17ad308d415a1357c9f7dd5eebc96759188321812fef8a9ec9a7b2fab6f5c845a06161192a0e4b84ea4d8d520b9c1')

package() {
  tar xJf data.tar.xz

  mv usr "${pkgdir}"
  mv opt "${pkgdir}"

  cd "${pkgdir}"
  mkdir usr/bin
  mv usr/local/bin/pdk usr/bin
  chmod 755 opt/puppetlabs/pdk/bin/pdk
  rm -rf usr/local
}
