# Maintainer: Changaco
# Maintainer: Pascal Bach
# Maintainer: Achilleas Pipinellis <axilleas@archlinux.info>

pkgname=origin-client-bin
pkgver=1.2.0
_hash=2e62fab
pkgrel=1
pkgdesc="The client tools for the Origin platform that powers OpenShift"
arch=(i686 x86_64)
url="https://github.com/openshift/origin"
license=('Apache')

_base_url=https://github.com/openshift/origin/releases/download/v$pkgver/openshift-origin-client-tools-v$pkgver-$_hash-linux
if [[ $CARCH == 'x86_64' ]]; then
	source=("$_base_url-64bit.tar.gz")
	sha256sums=('62d309592b27e42a84102a950d92a8c1b6b61ea488f7c2f3433bf38f64cea68b')
else
	source=("$_base_url-32bit.tar.gz")
	sha256sums=('8e903e6a81e9a8415532c6d7fbc86ab4c84818a4dad8fcf118776fa90424e95c')
fi

package() {
	install -D -m755 $srcdir/*/oc $pkgdir/usr/bin/oc
}
