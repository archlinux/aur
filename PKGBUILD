# Maintainer: Debendra Oli <debendraoli@pm.me>

pkgname=kurtosis-cli-bin
pkgver=0.84.6
pkgrel=1
pkgdesc="Kurtosis is a platform for packaging and launching environments of containerized services with a focus on approachability for the average developer."
arch=('x86_64')
depends=('docker')
url="https://github.com/kurtosis-tech/kurtosis"
license=('Business Source License 1.1')
source=("$pkgname-${pkgver//_/-}.tar.gz::${url}-cli-release-artifacts/releases/download/$pkgver/kurtosis-cli_${pkgver}_linux_amd64.tar.gz" "kurtosis.service" "kurtosis-cli-bin.install")
sha256sums=('c583a907acb33f02670ce02eb3f7455be20cd1d364874ba6c5f635458b5a2f7d' '8ed2e5900ec3aa6d5d00f37791eac8b66bedaf3fbeb0521a234c68e0d5633f45' '583b06844436a1cbc09c0a889561dc8aac3a692677667735ff3c50188550d3f6')

install=$pkgname.install

package() {
    install -Dm755 kurtosis "$pkgdir/usr/bin/kurtosis"
	install -Dm644 kurtosis.service "$pkgdir/usr/lib/systemd/user/kurtosis.service"
}
