# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>

_ver='1.5.0-alpha.1'
_hash='71d3fa9'
pkgname=openshift-origin
pkgver='1.5.0'
pkgrel=1
pkgdesc="OpenShift Origin is a platform for developing, building, and deploying containerized applications. See https://docs.openshift.org/latest for more on running OpenShift Origin."
arch=(x86_64)
url="https://github.com/openshift/origin"
license=('Apache')
depends=('docker')
source=("https://github.com/openshift/origin/releases/download/v${_ver}/openshift-origin-server-v${_ver}.${_hash}-linux-64bit.tar.gz")
sha256sums=('ec05350dc06889dca456d70252e3cb969aa6ce7ac8b873c02fac453ffd5f815f')

package() {
    cd "openshift-origin-server-v${_ver}+${_hash}-linux-64bit"
    find -not -path . -executable -type f -exec install -Dm755 {} "$pkgdir/usr/bin/{}" \;
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
