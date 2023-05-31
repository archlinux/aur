# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=ksops
pkgname=$_pkgname-bin
pkgver=4.2.1
pkgrel=0
pkgdesc="KSOPS - A Flexible Kustomize Plugin for SOPS Encrypted Resources"
url="https://github.com/viaduct-ai/kustomize-sops"
license=('APACHE')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz" "$_pkgname.conf")
arch=('x86_64')
sha512sums=('20c8cd50719766c7c02a496c5e320ce9972e22a57f0ab51fdfa07a53967a915f5d7e3e2caff31268b63e38fee8ee6aac607df85d69dfc79a285734e61c03a7e8'
            'b1d16ef836ee7a95669b4f801ff09050bed8217a7e826d0fe841bedb623b9e7ce46b8f9bca574fc53ad4aa159a1f6e35d413839661ba3063f6048af65f951714')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 -t $pkgdir/opt/kustomize/ $srcdir/$_pkgname
  install -D -m 0644 -t $pkgdir/usr/share/user-tmpfiles.d/ $srcdir/$_pkgname.conf
}

#vim: syntax=sh
