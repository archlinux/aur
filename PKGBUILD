# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=polaris-bin
pkgver=9.0.1
pkgrel=1
pkgdesc="Validation of best practices in Kubernetes"
arch=('x86_64')
url="https://github.com/FairwindsOps/polaris"
license=('Apache')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FairwindsOps/polaris/releases/download/${pkgver}/polaris_linux_amd64.tar.gz")
sha256sums=('b1dd747a6c0026501a8fbfdbc4714d1bcbf97178aa653885b7b0462ab96614bf')

package() {
	install -Dm 755 "$srcdir/polaris" -t "$pkgdir/usr/bin"

	"$pkgdir/usr/bin/polaris" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/polaris"
	"$pkgdir/usr/bin/polaris" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_polaris"
	"$pkgdir/usr/bin/polaris" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/polaris.fish"
}
