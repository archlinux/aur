# Maintainer: mark dot blakeney at bullet-systems dot net
# Contributor: Danilo Kuehn <dk[at]nogo-software[dot]de>
_pkgname=dry
pkgname=$_pkgname-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="dry: a terminal application to manage Docker containers and images"
url="https://github.com/moncho/$_pkgname"
arch=("x86_64" "i686" "armv7h" "aarch64")
license=("MIT")
depends=("docker")
_pkgdownload=${_pkgname}_${pkgver}
source_x86_64=("${_pkgdownload}-x86_64::$url/releases/download/v${pkgver}/$_pkgname-linux-amd64")
source_i686=("${_pkgdownload}-i686::$url/releases/download/v${pkgver}/$_pkgname-linux-386")
source_armv7h=("${_pkgdownload}-armv7h::$url/releases/download/v${pkgver}/$_pkgname-linux-armv7")
source_aarch64=("${_pkgdownload}-aarch64::$url/releases/download/v${pkgver}/$_pkgname-linux-arm64")
sha256sums_x86_64=('c160dea554c74544f68f1de5d406a9d211462caa75cab46c2ae8a46df28e0e36')
sha256sums_i686=('e44f365be129b4f1510a37fc5e306e31e78b82427647651466449519c8b0faec')
sha256sums_armv7h=('8d8c65e2f582462ee4632703be17ca59a3b4fcb932ebe3a879b2a86b437c431f')
sha256sums_aarch64=('cb3c466b1bda509155b66361bd00c131da8699aeaa8a2b70196b51cd6555991d')

package() {
  install -Dm755 "${srcdir}/${_pkgdownload}-$CARCH" "${pkgdir}/usr/bin/${_pkgname}"
}
