# Maintainer: Johannes Löthberg <demizide@gmail.com>
# Contributor: M Rawash <mrawash@gmail.com>

pkgname="urxvt-tabbedex-git"
pkgver=20120216
pkgrel=1
pkgdesc="Tabbed plugin for rxvt-unicode with many enhancements, development version"
arch=("any")
url='http://github.com/stepb/urxvt-tabbedex'
license=("GPL")
depends=('rxvt-unicode')
makedepends=('git')
provides=('urxvt-tabbedex')
conflicts=('urxvt-tabbedex')
install=${pkgname}.install

_gitroot="git://github.com/stepb/urxvt-tabbedex.git"
_gitname="urxvt-tabbedex"

build() {
  msg "Connecting to ${_gitroot}..."

  if [ -d ${srcdir}/${_gitname} ] ; then
    cd ${srcdir}/${_gitname} && git pull origin master
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting Installation..."

  install -Dm644 ${srcdir}/${_gitname}/tabbedex ${pkgdir}/usr/lib/urxvt/perl/tabbedex
}
