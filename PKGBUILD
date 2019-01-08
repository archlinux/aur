# Maintainer: ProFfeSsoRr <evvsoft@gmail.com>

pkgname=crictl-bin
pkgver=1.13.0
pkgrel=1
pkgdesc="CLI tool for Kubelet Container Runtime Interface (CRI)"
arch=(x86_64)
url="https://github.com/kubernetes-incubator/cri-tools/blob/master/docs/crictl.md"
license=('Apache')
provides=('crictl')
conflicts=('crictl')
source=("https://github.com/kubernetes-sigs/cri-tools/releases/download/v${pkgver}/crictl-v${pkgver}-linux-amd64.tar.gz"
        "crictl.yaml")
sha256sums=('9bdbea7a2b382494aff2ff014da328a042c5aba9096a7772e57fdf487e5a1d51'
            'd2725490e1fb2e6f565605f09871c1440371b85e04de5d70bbac05954d827f72')

package() {
  cd "$srcdir"
  install -Dm755 crictl "$pkgdir"/usr/bin/crictl
  install -Dm644 crictl.yaml "$pkgdir"/etc/crictl.yaml
}
