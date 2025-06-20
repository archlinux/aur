# Maintainer: Debendra Oli <debendraoli@pm.me>

pkgname=kurtosis-cli-bin
pkgver=1.9.1
pkgrel=1
pkgdesc="Kurtosis is a platform for packaging and launching environments of containerized services with a focus on approachability for the average developer."
arch=('x86_64')
depends=('docker')
url="https://github.com/kurtosis-tech/kurtosis"
license=('Business Source License 1.1')
source=("$pkgname-${pkgver//_/-}.tar.gz::${url}-cli-release-artifacts/releases/download/$pkgver/kurtosis-cli_${pkgver}_linux_amd64.tar.gz" "kurtosis.service" "kurtosis-cli-bin.install")
sha256sums=('2f48287c58fd4466d54b44bd651bc27b8d3bc137b5b33a683f8d7d4e94bbb4d1'
            'c6cb71131db441b91fbd550c61fbbdd1ae3e121803f5460083a1e71c70db3cd9'
            'ce59007498a06daddae5e6f8b2e193ac77d344fdaf3521219eaa22cab6b8d17f')

install=$pkgname.install

package() {
    install -Dm755 kurtosis "$pkgdir/usr/bin/kurtosis"
	install -Dm644 kurtosis.service "$pkgdir/usr/lib/systemd/user/kurtosis.service"
}
