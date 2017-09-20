# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>

_hash='c4dd4cf'
pkgname='openshift-origin-server-bin'
pkgver='3.6.0'
pkgrel=1
pkgdesc="OpenShift Origin is a platform for developing, building, and deploying containerized applications. See https://docs.openshift.org/latest for more on running OpenShift Origin."
arch=('x86_64')
url="https://github.com/openshift/origin"
license=('Apache')
depends=('docker')
source=("https://github.com/openshift/origin/releases/download/v${pkgver}/openshift-origin-server-v${pkgver}-${_hash}-linux-64bit.tar.gz")
sha512sums=('15ffb2d8df12b0abfdbcd5bf753614da0c48d925d7fc4ae4a67e09c88b3800b774a775cbfe431462b32fe7f7572e653f6954c46706fc852aa9b9b7460f069114')

package() {
    cd "openshift-origin-server-v${pkgver}-${_hash}-linux-64bit"
    find -not -path . -executable -type f -exec install -Dm755 {} "$pkgdir/usr/bin/{}" \;
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
