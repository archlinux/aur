# Maintainer: Mohammad Abdolirad <m.abdolirad@gmail.com>
# Contributor: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=wait4x-bin
pkgver=2.6.2
pkgrel=1
pkgdesc="Wait4X allows you to wait for a port or a service to enter the requested state"
arch=('x86_64' 'aarch64' 'armv6' 'armv7' 'ppc64le' 's390x')
url="https://wait4x.dev"
license=('Apache')
provides=('wait4x')
conflicts=('wait4x')
depends=('glibc')
source_x86_64=("https://github.com/atkrad/wait4x/releases/download/v$pkgver/wait4x-linux-amd64.tar.gz")
source_aarch64=("https://github.com/atkrad/wait4x/releases/download/v$pkgver/wait4x-linux-arm64.tar.gz")
source_armv6=("https://github.com/atkrad/wait4x/releases/download/v$pkgver/wait4x-linux-armv6.tar.gz")
source_armv7=("https://github.com/atkrad/wait4x/releases/download/v$pkgver/wait4x-linux-armv7.tar.gz")
source_ppc64le=("https://github.com/atkrad/wait4x/releases/download/v$pkgver/wait4x-linux-ppc64le.tar.gz")
source_s390x=("https://github.com/atkrad/wait4x/releases/download/v$pkgver/wait4x-linux-s390x.tar.gz")

sha256sums_x86_64=('9bb994844e683cf6d9128bd81c5d2431e515cec97bbf1c5d7208aaf2431a0161')
sha256sums_aarch64=('b692767ef2c01b6a5b3f473943d53c32b406cf44839374f7def13e9697d6f78b')
sha256sums_armv6=('bddbaad1db23b46b0baa2a7d430477468051d165efec3e15c1738db8c3492356')
sha256sums_armv7=('bb64913a7b964206b1afe39895f9b29e964118f48d7028424ee1d0dd00f1cdf0')
sha256sums_ppc64le=('351dc9a7b9da695a93b8799ad2774170ff899de99d0d1518b19881c6ce2b10e5')
sha256sums_s390x=('8b4d58f081b8f3eeadeb43307e86473f7dc59c63cce28e242eeed86af7a8090a')

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
