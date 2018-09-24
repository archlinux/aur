# Maintainer: Mattias Giese <mattias.giese@posteo.net>

pkgname=pdk
# https://puppet-pdk.s3.amazonaws.com/pdk/1.7.0.0/repos/deb/bionic/PC1/pdk_1.7.0.0-1bionic_amd64.deb
_pkgver=1.7.0.0-1bionic
pkgver=1.7.0.0
pkgrel=1
pkgdesc='Puppet Development Kit bundles tools and helpers to create high quality puppet modules'
arch=('x86_64')
url='https://github.com/puppetlabs/pdk'
options=(staticlibs !strip)
source=("https://puppet-pdk.s3.amazonaws.com/pdk/${pkgver}/repos/deb/bionic/PC1/pdk_${_pkgver}_amd64.deb")
md5sums=('c325346fa8a83f3d6911594ec101ddcc')

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
