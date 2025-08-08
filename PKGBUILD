# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Juan Tascon <juan at horlux dot org>
pkgname=wtfutil-bin
pkgver=0.46.0
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=('x86_64' 'aarch64' 'armv6h')
url="https://wtfutil.com"
license=('MPL-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://github.com/wtfutil/wtf/releases/download/v$pkgver/wtf_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/wtfutil/wtf/releases/download/v$pkgver/wtf_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("https://github.com/wtfutil/wtf/releases/download/v$pkgver/wtf_${pkgver}_linux_armv6.tar.gz")
sha256sums_x86_64=('cb8fbc59f6287e889d02ac1bd7c6ef7eab4c0b13c4ac56ce20d169bb49a0bb79')
sha256sums_aarch64=('6f8a8a5adc28e7d6fad27939dc310b6559110ca593d51ae07d2f49bfa1e23805')
sha256sums_armv6h=('ba0c5a342054c47dcb3c057bb5db685fa4a74883f0c0a0abacf640d5c30176d3')

package() {
  cd $(find . -name "wtf_$pkgver_*" -type d | sed 1q)
  install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm644 {README,CHANGELOG}.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}/"
}
