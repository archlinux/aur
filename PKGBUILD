pkgname=origin-client-bin
pkgver=1.1.4
_hash=3941102
pkgrel=1
pkgdesc="The client tools for the Origin platform that powers OpenShift"
arch=(i686 x86_64)
url="https://github.com/openshift/origin"
license=('Apache')

_base_url=https://github.com/openshift/origin/releases/download/v$pkgver/openshift-origin-client-tools-v$pkgver-$_hash-linux
if [[ $CARCH == 'x86_64' ]]; then
	source=("$_base_url-64bit.tar.gz")
	sha256sums=('da1061193596ca760dd1fea15858a44122e5524c2cba057275257e234d1999bd')
else
	source=("$_base_url-32bit.tar.gz")
	sha256sums=('c6f16a023b5c685932b0a525e09d086de7253610c135e492e35b3f255f3b190c')
fi

package() {
	install -D -m755 $srcdir/*/oc $pkgdir/usr/bin/oc
}
