# Maintainer: Mohammad Abdolirad <m.abdolirad@gmail.com>

pkgname=wait4x-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Wait4X allows you to wait for a port or a service to enter the requested state"
arch=('x86_64')
url="https://github.com/atkrad/wait4x"
license=('Apache')
provides=('wait4x')
conflicts=('wait4x')
depends=('glibc')
source=("${pkgname}-$pkgver::https://github.com/atkrad/wait4x/releases/download/v$pkgver/wait4x-linux-amd64")
sha256sums=('8b3f8d418668953b937679b211921323c4db1e431b3c3c988436bbbb053fb6f2')

package() {
        install -Dm 755 "${pkgname}-$pkgver" "$pkgdir/usr/bin/wait4x"

	"$pkgdir/usr/bin/wait4x" completion bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	"$pkgdir/usr/bin/wait4x" completion zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
	"$pkgdir/usr/bin/wait4x" completion fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"

}
