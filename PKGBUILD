# Maintainer: Andrew Mello <andrew@88plug.com>
pkgname=k3d-gpu
pkgver=0.1.2
pkgrel=1
pkgdesc="Bootstrap GPU-ready k3d clusters: launcher + NVIDIA device plugin manifest for k3s on Docker"
arch=('any')
url="https://github.com/88plug/k3d-gpu"
license=('custom:FSL-1.1-ALv2')
depends=('bash')
optdepends=(
    'docker: container runtime for the cluster'
    'k3d-git: k3d CLI to manage clusters'
    'kubectl: query and apply manifests'
    'nvidia-container-toolkit: GPU container runtime for Docker'
)
source=("git+https://github.com/88plug/k3d-gpu.git#tag=aur-v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 scripts/k3d-gpu              "$pkgdir/usr/bin/k3d-gpu"
    install -Dm644 share/nvidia-device-plugin.yml "$pkgdir/usr/share/k3d-gpu/nvidia-device-plugin.yml"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE.md    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
