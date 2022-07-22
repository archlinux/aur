# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=ksops
pkgname=$_pkgname-bin
pkgver=3.0.2
pkgrel=0
pkgdesc="KSOPS - A Flexible Kustomize Plugin for SOPS Encrypted Resources"
url="https://github.com/viaduct-ai/kustomize-sops"
license=('APACHE')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz" "$_pkgname.conf")
arch=('x86_64')
sha512sums=('47a8a766abc00f022ecc862554020b6908c77377c58db67be0da29bb17cb75eac50942349a551862b320f25bd8f1eec8b9271223b44f95970e7c39357f20cd90'
            'b1d16ef836ee7a95669b4f801ff09050bed8217a7e826d0fe841bedb623b9e7ce46b8f9bca574fc53ad4aa159a1f6e35d413839661ba3063f6048af65f951714')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 -t $pkgdir/opt/kustomize/ $srcdir/$_pkgname
  install -D -m 0644 -t $pkgdir/usr/share/user-tmpfiles.d/ $srcdir/$_pkgname.conf
}

#vim: syntax=sh
