# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=polaris-bin
pkgver=10.2.2
pkgrel=1
pkgdesc="Validation of best practices in Kubernetes"
arch=('x86_64')
url="https://github.com/FairwindsOps/polaris"
license=('Apache-2.0')
source=("https://github.com/FairwindsOps/polaris/releases/download/v${pkgver}/polaris_${pkgver}_linux_amd64.tar.gz")
sha256sums=('862305442292c6ba8d4d84b8d840e6c77aebf785f410929de2d81bcf72758187')

package() {
	install -Dm 755 "$srcdir/polaris" -t "$pkgdir/usr/bin"

	"$pkgdir/usr/bin/polaris" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/polaris"
	"$pkgdir/usr/bin/polaris" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_polaris"
	"$pkgdir/usr/bin/polaris" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/polaris.fish"
}
