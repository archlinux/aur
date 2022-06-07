# Maintainer: Mohammad Abdolirad <m.abdolirad@gmail.com>
# Contributor: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=wait4x-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="Wait4X allows you to wait for a port or a service to enter the requested state"
arch=('x86_64' 'aarch64' 'armv6' 'armv7' 'ppc64le' 's390x')
url="https://github.com/atkrad/wait4x"
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

sha256sums_x86_64=('401688740b179623c78d48cee57cbcf70a2f873cb7e54dbb8f0fba7489a5e5d9')
sha256sums_aarch64=('848cce5837303adf66a3d6531a97c40c344538c78ffea2ae17b04ee4e866e4ef')
sha256sums_armv6=('8e9d7703af01d01d28360fc52de961906f5165666b2612d47073a476f8a3288e')
sha256sums_armv7=('53a097938a3366fa7c18cf7b6d0caa8e225ffbeeea44cb1aa5e183c794833037')
sha256sums_ppc64le=('cea115a4e76a43d6900ee80fd85492b6a9562af9e04e2b013b32bf9aac3120b3')
sha256sums_s390x=('4e42eec89b95afb96421faf67bc12ea692a22ffee92b8fd1098c99d3992dff54')

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
