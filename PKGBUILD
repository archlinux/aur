# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kftui
pkgname=$_pkgname-bin
pkgver=0.27.11 # renovate: datasource=github-releases depName=hcavarsan/kftray
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
sha512sums_x86_64=('5a37a3b247660e50fcc679f7bab41766bd98ed3b89e1a9c613b762d73f867d7403c1ccfae40f6bfe57eb9f8b63490fc779f8071806a863b9d394131b23bdf2ac')
sha512sums_aarch64=('2906388c912fc77a059ae3c57dd16887d58e6ba3fc0fb7ef778de5e48927be163c1cd65d6c14f9b1ee7ea08ae3c723a7239a31a8dd50532f0b0832aa7cb73ffe')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
