# Maintainer: 13floorelevators <the13thfloorelevators@protonmail.com> <BURST-737A-XKSG-M424-67UVT>
                                                                       
pkgname=aggregator-git
_realname=aggregator
_realname2=vendor
pkgver=v1.0
pkgrel=1
pkgdesc="My fork of PoCC's BURST Miner Proxy"
arch=('x86_64')
url="https://github.com/RokyErickson/aggregator"
license=('GPL3')
makedepends=(go dep git go)
source=("git"+"https://github.com/RokyErickson/aggregator.git")
sha256sums=('SKIP')
pkgver() {
        cd "${srcdir}"/$"{_realname}"
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
   	cd "${srcdir}"/$"{_realname}"
	export GOPATH="${srcdir}"/$"{_realname}"
        dep ensure
	go build
}

package() {
        cd "${srcdir}"/"${_realname}"
        install -Dm755 "${_realname}" "${pkgdir}"$/usr/bin/"${_realname}"
	cd "${srcdir}/${_realname}"
        install -Dm755 "${_realname2}" "${pkgdir}"$/usr/bin/$"{_realname2}"
}

