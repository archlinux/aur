# Maintainer: Mohammad Abdolirad <m.abdolirad@gmail.com>
# Contributor: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=wait4x-bin
pkgver=2.14.2
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

sha256sums_x86_64=('27c26a4f97bb8ec1e15d5df5f03dda3e46c77f60f9f318881eea2a6b8601aa81')
sha256sums_aarch64=('1e24096eec851f2470159fb142159bbcd5006fa3dd8260894c3e0bc5a154cb34')
sha256sums_armv6=('53f8798708430cc1b4c299badf5dd7b710a0cf04e7f82326123b9b7966eef877')
sha256sums_armv7=('b056e805a7fe5e1a2e7eb1a3b6fd255ec314849427b093517a6689f0b1cf5094')
sha256sums_ppc64le=('f3a30b7d1ede27fb5b2b0b465302c9fe5c2e3af73d48f945f2a30d4c0f53e196')
sha256sums_s390x=('dc8bb856e9db6a03fab1e973c217fbeba44f365e10d5e3a95efa74424b87751f')

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
