# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Contributor: Vinay S Shastry <vinayshastry at gmail dot com>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=flarectl-bin
_pkgname="${pkgname%-bin}"
pkgver=0.119.0
pkgrel=1
pkgdesc='CLI application for interacting with a Cloudflare account'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url='https://github.com/cloudflare/cloudflare-go/releases'
license=('Apache-2.0')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${url}/download/v${pkgver}/${_pkgname}_${pkgver}_${_goos}_${_goarch}.tar.gz")
b2sums=('2e088798399b342db5aff85ce0aa12c493bed5a9d9a9964a8d829fbf596e1dbf05cf6f35b9f55e7efefc19eaaa16f4d1aebc87419a40c1a2b43fb6097397ad6b')

package() {
  install -D --mode 755 "$_pkgname" --target-directory "${pkgdir}/usr/bin"
  install -D --mode 644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -D --mode 644 README.md --target-directory "${pkgdir}/usr/share/doc/${_pkgname}"
}
