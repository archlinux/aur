# Maintainer: Jeroen Hooyberghs <jeroen@hooyberghs.org>

pkgname=puppet-bolt
_ubuntu_release=bionic
_pkgver="3.8.0-1${_ubuntu_release}"
pkgver=3.8.0

pkgrel=1
pkgdesc='Puppet stand alone task runner'
arch=('x86_64')
url='https://github.com/puppetlabs/bolt'
options=(staticlibs !strip)
source=("https://apt.puppetlabs.com/pool/${_ubuntu_release}/puppet6/p/puppet-bolt/puppet-bolt_${_pkgver}_amd64.deb")
md5sums=('c560bfe71336cb79dd3b7a46c46bd0af')

package() {
  tar xJf data.tar.xz

  mv usr "${pkgdir}"
  mv opt "${pkgdir}"

  cd "${pkgdir}"
  mkdir usr/bin
  mv usr/local/bin/bolt usr/bin
  chmod 755 opt/puppetlabs/bin/bolt
  rm -rf usr/local
}

