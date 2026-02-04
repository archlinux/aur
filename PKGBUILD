# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=guacone-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="CLI to interact with GUAC"
arch=('x86_64')
url="https://github.com/guacsec/guac"
license=('Apache-2.0')
source=("${pkgname}-${pkgver}::https://github.com/guacsec/guac/releases/download/v${pkgver}/guacone-linux-amd64")
sha256sums=('dc009d77280e1f56c7ed6a98632b961d3eb651688b81de89e78945d8bb50ac64')

package() {
	install -Dm 755 "$srcdir/${pkgname}-${pkgver}" "$pkgdir/usr/bin/guacone"

	"$pkgdir/usr/bin/guacone" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/guacone"
	"$pkgdir/usr/bin/guacone" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_guacone"
	"$pkgdir/usr/bin/guacone" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/guacone.fish"
}
