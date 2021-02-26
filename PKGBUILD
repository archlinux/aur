# Maintainer: Mattias Giese <mattias.giese@posteo.net>

pkgname=pdk
# https://puppet-pdk.s3.amazonaws.com/pdk/1.7.1.0/repos/deb/xenial/PC1/pdk_1.7.1.0-1xenial_amd64.deb
_ubuntu_release=bionic
pkgver=2.0.0.0
_pkgver="${pkgver}-1${_ubuntu_release}"

pkgrel=1
pkgdesc='Puppet Development Kit bundles tools and helpers to create high quality puppet modules'
arch=('x86_64')
url='https://github.com/puppetlabs/pdk'
options=(staticlibs !strip)
source=("http://apt.puppetlabs.com/pool/${_ubuntu_release}/puppet6/p/pdk/pdk_${_pkgver}_amd64.deb")
sha512sums=('a7aecaeaf354d6f28045cc2aea2bf4a260e9d76268623ad0dbee495b935edf7022e83e09e93eb73ac840e667a88b1dca1992b811181fe257d0b490f152262e26')

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
