# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=kftui
pkgname=$_pkgname-bin
pkgver=0.25.6 # renovate: datasource=github-releases depName=hcavarsan/kftray
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
sha512sums_x86_64=('c09051f81d2faa0c3c298d70dc71921d1f786b519fdec276f21b0730f85db6dca57db8aec6c50264c8f60a635f568fa9a58bb2e534b624b1b3b14f3ed04bfaf4')
sha512sums_aarch64=('72ca6427c437c6f93f1f6bd6a86ed93c166064cd7b70a4e7d818a2177572484a3220a6b7e16f4e67cae227a5e83fcf32e720e77037cda9cb3c205dde895e2ac5')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 "$srcdir/$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
