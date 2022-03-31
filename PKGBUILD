# Maintainer: Mohammad Abdolirad <m.abdolirad@gmail.com>
# Contributor: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=wait4x-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Wait4X allows you to wait for a port or a service to enter the requested state"
arch=('x86_64')
url="https://github.com/atkrad/wait4x"
license=('Apache')
provides=('wait4x')
conflicts=('wait4x')
depends=('glibc')
source=("${pkgname}-$pkgver::https://github.com/atkrad/wait4x/releases/download/v$pkgver/wait4x-linux-amd64")
sha256sums=('902d7214f6a394a7c3733a6c1e7e3211c5b93e3152e33a92ee8b5ff076038e8c')

package() {
        install -Dm 755 "${pkgname}-$pkgver" "$pkgdir/usr/bin/wait4x"

	install -d 755 "$pkgdir/usr/share/bash-completion/completions"
	install -d 755 "$pkgdir/usr/share/zsh/site-functions"
	install -d 755 "$pkgdir/usr/share/fish/vendor_completions.d"

	"$pkgdir/usr/bin/wait4x" completion bash > "$pkgdir/usr/share/bash-completion/completions/wait4x"
	"$pkgdir/usr/bin/wait4x" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_wait4x"
	"$pkgdir/usr/bin/wait4x" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/wait4x.fish"

}
