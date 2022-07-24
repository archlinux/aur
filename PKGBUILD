# Maintainer: Mohammad Abdolirad <m.abdolirad@gmail.com>
# Contributor: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=wait4x-bin
pkgver=2.5.0
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

sha256sums_x86_64=('40fc4ce21ef0de8610579513b5846e747a2164b7d9291ad6a0a182b753df460f')
sha256sums_aarch64=('d62cb61676ab2c429b8c25d22c2b0605cd7416e4bc0d1d53ae00c41bf8e15cc5')
sha256sums_armv6=('a0fd9594ad03b716b269e8c30497cda5f36e671227e988b37c8c2d7226e8ad47')
sha256sums_armv7=('512f89debc01011d4f45e0268bc21079b260829f7d161fc99a07842ca0e8c508')
sha256sums_ppc64le=('4b6d6fabca0d00604e715cca8571591a9968fa8ceefbbc945985a3726d29b9d5')
sha256sums_s390x=('b0e9257bef8cff1de3c133abbd4279211a4f955b82e4247bd720ef87cadff773')

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
