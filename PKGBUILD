# Maintainer: Changaco
# Maintainer: Pascal Bach
# Maintainer: Achilleas Pipinellis <axilleas@archlinux.info>

pkgname=origin-client-bin
pkgver=1.2.1
_hash=5e723f6
pkgrel=1
pkgdesc="The client tools for the Origin platform that powers OpenShift"
arch=(i686 x86_64)
url="https://github.com/openshift/origin"
license=('Apache')

_base_url=https://github.com/openshift/origin/releases/download/v$pkgver/openshift-origin-client-tools-v$pkgver-$_hash-linux
if [[ $CARCH == 'x86_64' ]]; then
	source=("$_base_url-64bit.tar.gz")
	sha256sums=('50af8fc25295cebaf7a77d4cfe41ef19adc9d3bbecf57719ff4bdd9bb173b5d9')
else
	source=("$_base_url-32bit.tar.gz")
	sha256sums=('1c914f59916402e63ed1a87fa6c6eed03b557bdb56b27af5640c7056ea638e80')
fi

package() {
	install -D -m755 $srcdir/*/oc $pkgdir/usr/bin/oc
}
