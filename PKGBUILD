# Maintainer: Mohammad Abdolirad <m.abdolirad@gmail.com>
# Contributor: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=wait4x-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Wait4X allows you to wait for a port or a service to enter the requested state"
arch=('x86_64' 'aarch64' 'armv6' 'armv7' 'ppc64le' 's390x')
url="https://wait4x.dev"
license=('Apache')
provides=('wait4x')
conflicts=('wait4x')
depends=('glibc')
source_x86_64=("https://github.com/wait4x/wait4x/releases/download/v$pkgver/wait4x-linux-amd64.tar.gz")
source_aarch64=("https://github.com/wait4x/wait4x/releases/download/v$pkgver/wait4x-linux-arm64.tar.gz")
source_armv6=("https://github.com/wait4x/wait4x/releases/download/v$pkgver/wait4x-linux-armv6.tar.gz")
source_armv7=("https://github.com/wait4x/wait4x/releases/download/v$pkgver/wait4x-linux-armv7.tar.gz")
source_ppc64le=("https://github.com/wait4x/wait4x/releases/download/v$pkgver/wait4x-linux-ppc64le.tar.gz")
source_s390x=("https://github.com/wait4x/wait4x/releases/download/v$pkgver/wait4x-linux-s390x.tar.gz")

sha256sums_x86_64=('f3203faa4fbbecf5da09ca6c12add14985660547d8b4e160bb3408fa0d774f53')
sha256sums_aarch64=('bf66525018a5bcc96bffdafb709c96dac4d80a903ce44f4226285de8aedaa844')
sha256sums_armv6=('ed0a4ff7fe981f1cc0a7feb4bba744dba007fdebbb4f7ac8de9c0600ca857a67')
sha256sums_armv7=('fa514609840b5be84af57627ad41e1ec2b1afa277dd354b43ebe934f9cc60aae')
sha256sums_ppc64le=('23a273e27a1e6ec02655cba53e0a6f6d73e908579837895797d6304389e9f834')
sha256sums_s390x=('cee10fcba513271cf891d519f9e9e58d20b573e57844c26f9fe88c5667020eb9')

package() {
  install -Dm 755 "$srcdir/wait4x" "$pkgdir/usr/bin/wait4x"
	install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -d 755 "$pkgdir/usr/share/bash-completion/completions"
	install -d 755 "$pkgdir/usr/share/zsh/site-functions"
	install -d 755 "$pkgdir/usr/share/fish/vendor_completions.d"

	"$pkgdir/usr/bin/wait4x" completion bash > "$pkgdir/usr/share/bash-completion/completions/wait4x"
	"$pkgdir/usr/bin/wait4x" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_wait4x"
	"$pkgdir/usr/bin/wait4x" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/wait4x.fish"
}
