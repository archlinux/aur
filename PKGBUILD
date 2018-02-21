# Maintainer: Mattias Giese <mattias.giese@posteo.net>

pkgname=pdk
_pkgver=1.3.2.0-1xenial
pkgver=1.3.2.0
pkgrel=1
pkgdesc='Puppet Development Kit bundles tools and helpers to create high quality puppet modules'
arch=('x86_64')
url='https://github.com/puppetlabs/pdk'
options=(staticlibs !strip)
md5sums=('66999e125e67c5cd314dc5e6b0c1d016')
source=("http://apt.puppetlabs.com/pool/xenial/puppet5/p/pdk/pdk_${_pkgver}_amd64.deb")

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
