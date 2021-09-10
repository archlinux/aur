# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Juan Tascon <juan at horlux dot org>
pkgname=wtfutil-bin
pkgver=0.39.2
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=('x86_64' 'aarch64' 'armv6h')
url="https://wtfutil.com"
license=('MPL2')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://github.com/wtfutil/wtf/releases/download/v$pkgver/wtf_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/wtfutil/wtf/releases/download/v$pkgver/wtf_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("https://github.com/wtfutil/wtf/releases/download/v$pkgver/wtf_${pkgver}_linux_armv6.tar.gz")
sha256sums_x86_64=('5733dbaafdd736381e5097dda24fbd085c4a2ede538d3c65a24c832c31d0a5ea')
sha256sums_aarch64=('cd2497204c9c7e1420bf85cf4f93bfbd887f9b94da3a87be9edf1a775888a7e7')
sha256sums_armv6h=('1ef92f68ea2fedc2da60482764a90707931a10aca3b3737fa504a54bf748c2a9')

package() {
  cd $(find . -name "wtf_$pkgver_*" -type d | sed 1q)
  install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
