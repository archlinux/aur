# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>

_hash='7ed6862'
pkgname='openshift-origin-server-bin'
pkgver='3.7.0'
pkgrel=1
pkgdesc="OpenShift Origin is a platform for developing, building, and deploying containerized applications. See https://docs.openshift.org/latest for more on running OpenShift Origin."
arch=('x86_64')
url="https://github.com/openshift/origin"
license=('Apache')
depends=('docker')
source=("https://storage.googleapis.com/origin-ci-test/branch-logs/origin/v${pkgver}/builds/test_branch_origin_cross/1032/artifacts/zips/openshift-origin-server-v${pkgver}-${_hash}-linux-64bit.tar.gz")
sha512sums=('bc8ea5111d82e8cbf6c586ff829d19c684456c889462b4f1b41aca5fe65474a394ccdea5498391d4de1db3d2ba8ce4d214de9a9d37f98abf5b80cb5838c2cd0b')

package() {
    cd "openshift-origin-server-v${pkgver}-${_hash}-linux-64bit"
    find -not -path . -executable -type f -exec install -Dm755 {} "$pkgdir/usr/bin/{}" \;
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
