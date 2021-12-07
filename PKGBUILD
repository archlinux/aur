# Maintainer: Mattias Giese <mattias.giese@posteo.net>

pkgname=pdk
# https://puppet-pdk.s3.amazonaws.com/pdk/1.7.1.0/repos/deb/xenial/PC1/pdk_1.7.1.0-1xenial_amd64.deb
_ubuntu_release=bionic
pkgver=2.3.0.0
_pkgver="${pkgver}-1${_ubuntu_release}"

pkgrel=2
pkgdesc='Puppet Development Kit bundles tools and helpers to create high quality puppet modules'
arch=('x86_64')
url='https://github.com/puppetlabs/pdk'
options=(staticlibs !strip)
source=("http://apt.puppetlabs.com/pool/${_ubuntu_release}/puppet7/p/pdk/pdk_${_pkgver}_amd64.deb")
sha512sums=('2f8fa578ec28a8a21386434c5d0cd64653afac4052b3956ee8e2f48510ad160669f944f9552485b006af4eb92b55b6d03b93c7b7a645977b82622fd7c50cdc72')

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

