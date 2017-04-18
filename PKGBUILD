# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>

_ver='3.6.0-alpha.1'
_hash='46942ad'
pkgname=openshift-origin
pkgver='3.6.0'
pkgrel=1
pkgdesc="OpenShift Origin is a platform for developing, building, and deploying containerized applications. See https://docs.openshift.org/latest for more on running OpenShift Origin."
arch=(x86_64)
url="https://github.com/openshift/origin"
license=('Apache')
depends=('docker')
source=("https://github.com/openshift/origin/releases/download/v${_ver}/openshift-origin-server-v${_ver}-${_hash}-linux-64bit.tar.gz")
sha256sums=('ac72399befd3a7f147d09d556853f6871a9a78bec0eb63f9a5e56fb01a094eb3')

package() {
    cd "openshift-origin-server-v${_ver}-${_hash}-linux-64bit"
    find -not -path . -executable -type f -exec install -Dm755 {} "$pkgdir/usr/bin/{}" \;
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
