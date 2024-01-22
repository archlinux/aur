# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Juan Tascon <juan at horlux dot org>
pkgname=wtfutil-bin
pkgver=0.43.0
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
sha256sums_x86_64=('7734c22eb4bbe40b5b47e20d60d550673f418030bca27db81471bc86eb577c7f')
sha256sums_aarch64=('22fff35b0617be775aeb57bb643dee3155ef838a5e0f7997794a83c48884412e')
sha256sums_armv6h=('46b18c87ed3f0b012b6209e5188e037be090e0a2b19fd2caf658ed0bb47dd04b')

package() {
  cd $(find . -name "wtf_$pkgver_*" -type d | sed 1q)
  install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}/"
}
