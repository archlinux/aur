# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=polaris-bin
pkgver=10.2.1
pkgrel=1
pkgdesc="Validation of best practices in Kubernetes"
arch=('x86_64')
url="https://github.com/FairwindsOps/polaris"
license=('Apache-2.0')
source=("https://github.com/FairwindsOps/polaris/releases/download/v${pkgver}/polaris_${pkgver}_linux_amd64.tar.gz")
sha256sums=('0a11dd32e6028352529d586a38c633d71f6929eee82501e3a696b27ebf9bae13')

package() {
	install -Dm 755 "$srcdir/polaris" -t "$pkgdir/usr/bin"

	"$pkgdir/usr/bin/polaris" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/polaris"
	"$pkgdir/usr/bin/polaris" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_polaris"
	"$pkgdir/usr/bin/polaris" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/polaris.fish"
}
