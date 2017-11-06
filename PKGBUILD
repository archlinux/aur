# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>

_hash='008f2d5'
pkgname='openshift-origin-server-bin'
pkgver='3.6.1'
pkgrel=1
pkgdesc="OpenShift Origin is a platform for developing, building, and deploying containerized applications. See https://docs.openshift.org/latest for more on running OpenShift Origin."
arch=('x86_64')
url="https://github.com/openshift/origin"
license=('Apache')
depends=('docker')
source=("https://github.com/openshift/origin/releases/download/v${pkgver}/openshift-origin-server-v${pkgver}-${_hash}-linux-64bit.tar.gz")
sha512sums=('b332f5437c7a006eac7730b1b90d501a4bb8bd9ebd4015624a2df6bee5763bc46935e3bf3dfaa9cb7814e8b4b8b4a709f5a35b37dac69b31291e0673f29e8b54')

package() {
    cd "openshift-origin-server-v${pkgver}-${_hash}-linux-64bit"
    find -not -path . -executable -type f -exec install -Dm755 {} "$pkgdir/usr/bin/{}" \;
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
