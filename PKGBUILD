# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=ksops
pkgname=$_pkgname-bin
pkgver=4.1.1
pkgrel=0
pkgdesc="KSOPS - A Flexible Kustomize Plugin for SOPS Encrypted Resources"
url="https://github.com/viaduct-ai/kustomize-sops"
license=('APACHE')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz" "$_pkgname.conf")
arch=('x86_64')
sha512sums=('e965d4bf3aabe3b9ff04a0b705f17211534f8e3d0c88d706bdd2c145fb34b36deea5d80410b80758a66486805a7965eefd9ce078ef105fc6755719e39207a2bc'
            'b1d16ef836ee7a95669b4f801ff09050bed8217a7e826d0fe841bedb623b9e7ce46b8f9bca574fc53ad4aa159a1f6e35d413839661ba3063f6048af65f951714')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 -t $pkgdir/opt/kustomize/ $srcdir/$_pkgname
  install -D -m 0644 -t $pkgdir/usr/share/user-tmpfiles.d/ $srcdir/$_pkgname.conf
}

#vim: syntax=sh
