pkgname=origin-client-bin
pkgver=1.1.1
_hash=e1d9873
pkgrel=1
pkgdesc="The client tools for the Origin platform that powers OpenShift"
arch=(i686 x86_64)
url="https://github.com/openshift/origin"
license=('Apache')

_base_url=https://github.com/openshift/origin/releases/download/v$pkgver/openshift-origin-client-tools-v$pkgver-$hash-linux
if [[ $CARCH == 'x86_64' ]]; then
	source=("$_base_url-64bit.tar.gz")
	sha1sums=('adacd8d8096dd565d46eacf8f5dcc86a3a9059f3')
else
	source=("$_base_url-32bit.tar.gz")
	sha1sums=('10c3d9545aeff90e10a0ed2606fcc399be4596a2')
fi

package() {
	install -D -m755 $srcdir/*/oc $pkgdir/usr/bin/oc
}
