# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Juan Tascon <juan at horlux dot org>
pkgname=wtfutil-bin
pkgver=0.39.0
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
sha256sums_x86_64=('d16b519b31bd2b990ec3a3b7dd7b343e63b5007478fb6f92ad4afd08e5cecdf9')
sha256sums_aarch64=('51c281989afa44047f24801b1c007a168d80f9adf3945065c492c07dbd8d214a')
sha256sums_armv6h=('c048ebdc8c9c9ad6a197a7d4f4ba381cb5f5a785f70fe5dc00ce39b03e9c144b')

package() {
  cd $(find . -name "wtf_$pkgver_*" -type d | sed 1q)
  install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
