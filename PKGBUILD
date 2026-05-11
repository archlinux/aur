pkgname=sub2clash-bin
pkgver=1.1.3
pkgrel=1
pkgdesc='Convert subscription links to Clash and Clash.Meta configs'
arch=('x86_64')
url='https://github.com/bestnite/sub2clash'
license=('MIT')
depends=('glibc')
provides=('sub2clash')
conflicts=('sub2clash')
source=(
  "sub2clash_${pkgver}_linux_amd64.tar.gz::https://github.com/bestnite/sub2clash/releases/download/v${pkgver}/sub2clash_${pkgver}_linux_amd64.tar.gz"
)
sha256sums=('cd683bc60b860f2c4686a7236a6b1d311b680e67d776cd413e986cd4ce632ebb')

package() {
  cd "${srcdir}/sub2clash_${pkgver}_linux_amd64"

  install -Dm755 sub2clash "${pkgdir}/usr/bin/sub2clash"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 templates/template_clash.yaml "${pkgdir}/usr/share/sub2clash/templates/template_clash.yaml"
  install -Dm644 templates/template_meta.yaml "${pkgdir}/usr/share/sub2clash/templates/template_meta.yaml"
}
