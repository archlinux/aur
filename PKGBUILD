# Maintainer: ProFfeSsoRr <evvsoft at gmail dot com>

pkgname=crictl-bin
pkgver=1.11.1
pkgrel=2
pkgdesc="CLI tool for Kubelet Container Runtime Interface (CRI)"
arch=(x86_64)
url="https://github.com/kubernetes-incubator/cri-tools/blob/master/docs/crictl.md"
license=('Apache')
provides=('crictl')
conflicts=('crictl')
source=("https://github.com/kubernetes-incubator/cri-tools/releases/download/v${pkgver}/crictl-v${pkgver}-linux-amd64.tar.gz"
        "crictl.yaml")
sha256sums=('ccf83574556793ceb01717dc91c66b70f183c60c2bbec70283939aae8fdef768'
            'd2725490e1fb2e6f565605f09871c1440371b85e04de5d70bbac05954d827f72')

package() {
  cd "$srcdir"
  install -Dm755 crictl "$pkgdir"/usr/bin/crictl
  install -Dm644 crictl.yaml "$pkgdir"/etc/crictl.yaml
}

