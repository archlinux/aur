# Maintainer: Wainer Vandelli <wainer dot vandelli at gmail dot com>
pkgname=cern-ca-certs
pkgver=20261105_1
pkgrel=1
pkgdesc="CERN CA certificates"
arch=("any")
url="https://ca.cern.ch/ca/"
license=(unknown)
depends=(p11-kit ca-certificates-utils)
makedepends=(rpmextract)

_version=${pkgver//_/-}
source=("https://linuxsoft.cern.ch/cern/alma/9.9/CERN/x86_64/Packages/c/CERN-CA-certs-${_version}.al9.cern.noarch.rpm")
sha256sums=('7b12ab9f892b72d65111ba5c13f862bc2d0afba31907a14d77224c611823cecb')

install=cern-ca-certs.install

package() {
    rpmextract.sh *.rpm
    mkdir -p ${pkgdir}/etc/ca-certificates/trust-source/anchors
    mv ${srcdir}/etc/pki/tls/certs/*.crt ${pkgdir}/etc/ca-certificates/trust-source/anchors
}
