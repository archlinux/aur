# Maintainer: Fabricio Caseiro <fcaseiro@gmail.com>

_pkgname='cmctl'
pkgname="${_pkgname}-bin"
pkgver=1.8.2
pkgrel=1
pkgdesc='cmctl is a CLI tool that can help you to manage cert-manager resources inside your cluster'
arch=('aarch64' 'x86_64')
url='https://cert-manager.io/docs/usage/cmctl/'
license=('Apache')
depends=()
optdepends=()
makedepends=()
conflicts=("${_pkgname}")
provides=('cmctl' 'cmctl-bin')

source_aarch64=("$_pkgname-$pkgver.tar.gz::https://github.com/cert-manager/cert-manager/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.gz")
source_x86_64=("$_pkgname-$pkgver.tar.gz::https://github.com/cert-manager/cert-manager/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz")
sha256sums_aarch64=('646c9e214a590b7ef344680840b636428c76af1750b374b004c1674f5becb77b')
sha256sums_amd64=('10bde6a2fd15e42626435abe8a368e4240cc6ef6896b50abc39c0b2ddd17e554')

package() {
  cd "${srcdir}"
  install -Dm755 "cmctl" "${pkgdir}/usr/bin/cmctl"
}
