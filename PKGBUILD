# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=polaris-bin
pkgver=9.2.1
pkgrel=1
pkgdesc="Validation of best practices in Kubernetes"
arch=('x86_64')
url="https://github.com/FairwindsOps/polaris"
license=('Apache-2.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FairwindsOps/polaris/releases/download/${pkgver}/polaris_linux_amd64.tar.gz")
sha256sums=('752f003e29d223dfc22e3d6c14d6002c59b81f98bd37f4d96482a4247d825090')

package() {
	install -Dm 755 "$srcdir/polaris" -t "$pkgdir/usr/bin"

	"$pkgdir/usr/bin/polaris" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/polaris"
	"$pkgdir/usr/bin/polaris" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_polaris"
	"$pkgdir/usr/bin/polaris" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/polaris.fish"
}
