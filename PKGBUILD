# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Tom Hudson <mail at tomnomnom dot com>

_srcname=assetfinder
pkgname=assetfinder-git
pkgver=r17.e0a2b33
pkgrel=1
pkgdesc="Find domains and subdomains related to a given domain"
arch=('any')
url="https://github.com/tomnomnom/assetfinder"
license=('MIT')
makedepends=('go' 'git')
conflicts=('assetfinder')

prepare() {
  export GOPATH="$srcdir"/gopath
}

package() {
  go get -u github.com/tomnomnom/${_srcname}
  mkdir -p ${pkgdir}/usr/bin
  install $GOPATH/bin/${_srcname} ${pkgdir}/usr/bin/${_srcname}
}
