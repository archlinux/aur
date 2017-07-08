# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>

_hash='7b451fc'
pkgname='openshift-origin-server-bin'
pkgver='1.5.1'
pkgrel=3
pkgdesc="OpenShift Origin is a platform for developing, building, and deploying containerized applications. See https://docs.openshift.org/latest for more on running OpenShift Origin."
arch=('x86_64')
url="https://github.com/openshift/origin"
license=('Apache')
depends=('docker')
source=("https://github.com/openshift/origin/releases/download/v${pkgver}/openshift-origin-server-v${pkgver}-${_hash}-linux-64bit.tar.gz")
sha512sums=('052215370745d5934b1e456d41433b986a6c9265a3d426561de5c36be2266cd0008032ff9c910ac0229a580d86b44db336d4eea320ef6a9de606ca939e3aced3')

package() {
    cd "openshift-origin-server-v${pkgver}-${_hash}-linux-64bit"
    find -not -path . -executable -type f -exec install -Dm755 {} "$pkgdir/usr/bin/{}" \;
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
