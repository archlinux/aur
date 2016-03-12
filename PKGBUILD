pkgname=origin-client-bin
pkgver=1.1.3
_hash=cffae05
pkgrel=1
pkgdesc="The client tools for the Origin platform that powers OpenShift"
arch=(i686 x86_64)
url="https://github.com/openshift/origin"
license=('Apache')

_base_url=https://github.com/openshift/origin/releases/download/v$pkgver/openshift-origin-client-tools-v$pkgver-$_hash-linux
if [[ $CARCH == 'x86_64' ]]; then
	source=("$_base_url-64bit.tar.gz")
	sha1sums=('9e86b96930946467bae0f7011774018017103f69')
else
	source=("$_base_url-32bit.tar.gz")
	sha1sums=('6f7cb098b0af0c22f68c7950db0b7821155f2a16')
fi

package() {
	install -D -m755 $srcdir/*/oc $pkgdir/usr/bin/oc
}
