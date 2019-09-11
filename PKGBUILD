# Maintainer: ProFfeSsoRr <evvsoft@gmail.com>

pkgname=crictl-bin
pkgver=1.15.0
pkgrel=1
pkgdesc="CLI tool for Kubelet Container Runtime Interface (CRI)"
arch=(x86_64)
url="https://github.com/kubernetes-incubator/cri-tools/blob/master/docs/crictl.md"
license=('Apache')
provides=('crictl')
conflicts=('crictl')
source=("https://github.com/kubernetes-sigs/cri-tools/releases/download/v${pkgver}/crictl-v${pkgver}-linux-amd64.tar.gz"
        "crictl.yaml")
sha256sums=('c3b71be1f363e16078b51334967348aab4f72f46ef64a61fe7754e029779d45a'
            'd2725490e1fb2e6f565605f09871c1440371b85e04de5d70bbac05954d827f72')

package() {
  cd "$srcdir"
  install -Dm755 crictl "$pkgdir"/usr/bin/crictl
  install -Dm644 crictl.yaml "$pkgdir"/etc/crictl.yaml
}
