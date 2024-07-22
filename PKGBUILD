# Maintainer: Jeroen Hooyberghs <jeroen@hooyberghs.org>

pkgname=puppet-bolt
_ubuntu_release=bionic
_pkgver="3.30.0-1${_ubuntu_release}"
pkgver=3.30.0

pkgrel=1
pkgdesc='Puppet stand alone task runner'
arch=('x86_64')
url='https://github.com/puppetlabs/bolt'
options=(staticlibs !strip)
source=("https://apt.puppetlabs.com/pool/${_ubuntu_release}/puppet/p/puppet-bolt/puppet-bolt_${_pkgver}_amd64.deb")
md5sums=('0a24293a183c00ec124b4a7d1f08e6d4')

package() {
  tar xzf data.tar.gz

  mv usr "${pkgdir}"
  mv opt "${pkgdir}"

  cd "${pkgdir}"
  mkdir usr/bin
  mv usr/local/bin/bolt usr/bin
  chmod 755 opt/puppetlabs/bin/bolt
  rm -rf usr/local
}

