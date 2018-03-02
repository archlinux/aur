# Maintainer: Mattias Giese <mattias.giese@posteo.net>

pkgname=pdk
_pkgver=1.4.1.1-1xenial
pkgver=1.4.1.1
pkgrel=1
pkgdesc='Puppet Development Kit bundles tools and helpers to create high quality puppet modules'
arch=('x86_64')
url='https://github.com/puppetlabs/pdk'
options=(staticlibs !strip)
source=("http://apt.puppetlabs.com/pool/xenial/puppet5/p/pdk/pdk_${_pkgver}_amd64.deb")
md5sums=('753a7fab6286c3a43e10f11122fffe5b')

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
