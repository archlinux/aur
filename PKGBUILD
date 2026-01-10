# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kftui
pkgname=$_pkgname-bin
pkgver=0.27.7 # renovate: datasource=github-releases depName=hcavarsan/kftray
pkgrel=1
pkgdesc="🦀 ⚡ kubectl port forward manager, with support for UDP and proxy connections through k8s clusters"
url="https://github.com/hcavarsan/kftray"
license=('GPL-3.0-only')
source_x86_64=(
  "$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/${_pkgname}_linux_amd64"
)
source_aarch64=(
  "$_pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/${_pkgname}_linux_arm64"
)
arch=('x86_64' 'aarch64')
sha512sums_x86_64=('9898b98784ead7eae461db98c02956e0db3b5a5baa25b19a934d44c9a7c6469104992693896067efdfb65fe670ac97baf2280ff3250ef86eeb0fdeb834681bd4')
sha512sums_aarch64=('19c643b4cefc378779e6506c348f6c9881195b00b6b0a51650ce743c3794288b12bcd8b4c6f278dabc34d3a3fbebec35b08b880e332b7b9681b1ee200f7dbf0e')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
