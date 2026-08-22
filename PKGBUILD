pkgname=radar-bin
pkgver=1.11.0
pkgrel=1
pkgdesc="Open source Kubernetes UI - prebuilt binary"
arch=('x86_64' 'aarch64')
url="https://github.com/skyhook-io/radar"
license=('Apache-2.0')
provides=('radar' 'kubectl-radar')
conflicts=('radar' 'kubectl-radar')
options=('!strip')

source_x86_64=("radar-${pkgver}-x86_64.tar.gz::https://github.com/skyhook-io/radar/releases/download/v${pkgver}/radar_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("radar-${pkgver}-aarch64.tar.gz::https://github.com/skyhook-io/radar/releases/download/v${pkgver}/radar_v${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('d333e2065b430331358ce94e593ed8b8df098c113bb13cfcb9ff3e85bbe68961')
sha256sums_aarch64=('3d11ecb8abdca4350898a88eaddf81a987812b77981bbd3c0d85d3a7635e5ab5')

package() {
    cd "$srcdir"

    install -Dm755 kubectl-radar "$pkgdir/usr/bin/kubectl-radar"
    ln -s kubectl-radar "$pkgdir/usr/bin/radar"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
