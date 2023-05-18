#
# Arch Linux PKGBUILD for dns_tools 
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='dns_tools'
pkgdesc='DNS Tools for managing DNSSEC aka easy dnssec'
_gitname='dns_tools'

pkgver=2.3.1
pkgrel=1
url="https://github.com/gene-git/dns_tools"

arch=(any)
license=(MIT)
# tomli only needed for python < 3.11
depends=('python>3.9' 'python-tomli' 'ldns')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-poetry' 'rsync')
_mkpkg_depends=('python>minor')
source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}")
sha512sums=('SKIP')

build() {
    cd "${_gitname}"
    /usr/bin/rm -f dist/*
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "${_gitname}"
    ./do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:
