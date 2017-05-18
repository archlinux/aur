# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>

_hash='7b451fc'
pkgname='openshift-origin-bin'
pkgver='1.5.1'
pkgrel=1
pkgdesc="OpenShift Origin is a platform for developing, building, and deploying containerized applications. See https://docs.openshift.org/latest for more on running OpenShift Origin."
arch=('x86_64')
url="https://github.com/openshift/origin"
license=('Apache')
depends=('docker')
source=("https://github.com/openshift/origin/releases/download/v${pkgver}/openshift-origin-server-v${pkgver}-${_hash}-linux-64bit.tar.gz")
sha256sums=('abe50d51aa2485cac9374026a46c30901335f86171d79b7a5747f289e26f9cd0')

package() {
    cd "openshift-origin-server-v${pkgver}-${_hash}-linux-64bit"
    find -not -path . -executable -type f -exec install -Dm755 {} "$pkgdir/usr/bin/{}" \;
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
