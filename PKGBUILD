# Maintainer: Ariel AxionL <axionl@aosc.io>

pkgname=openshift-origin-client-bin
pkgver=3.9.0
pkgrel=1
groups=('openshift-origin')
provides=("openshift-origin-client")
pkgdesc="Enterprise Kubernetes for Developers ."
arch=('x86_64')
url="https://github.com/filebrowser/filebrowser"
license=('Apache')
depends=('glibc')
optdepends=('kubernetes: https://github.com/kubernetes/kubernetes')
source_x86_64=(openshift-origin-client.tar.gz::https://github.com/openshift/origin/releases/download/v3.9.0/openshift-origin-client-tools-v$pkgver-191fece-linux-64bit.tar.gz)

sha256sums_x86_64=('6ed2fb1579b14b4557e4450a807c97cd1b68a6c727cd1e12deedc5512907222e')

package() {
    dir="$srcdir/openshift-origin-client-tools-v$pkgver-191fece-linux-64bit"
    install -Dm644 $dir/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 $dir/oc $pkgdir/usr/bin/oc
}
