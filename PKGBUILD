# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=k0s-bin
pkgver=1.35.1+k0s.0
pkgrel=1
pkgdesc="k0s - Zero Friction Kubernetes"
arch=('x86_64')
url="https://github.com/k0sproject/k0s"
license=('Apache-2.0')
source=("https://github.com/k0sproject/k0s/releases/download/v${pkgver}/k0s-v${pkgver}-amd64")
sha256sums=('a65ce7cc1a0645dfce517c582a875a14b9660b5913abfee4c0edf3dc7e169e78')
options=(!strip)

package() {
	install -Dm 755 "$srcdir/k0s-v${pkgver}-amd64" "$pkgdir/usr/bin/k0s"

	"$pkgdir/usr/bin/k0s" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/k0s"
	"$pkgdir/usr/bin/k0s" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_k0s"
	"$pkgdir/usr/bin/k0s" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/k0s.fish"
}
