# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='ecsta'
pkgver=0.4.5
pkgrel=1
pkgdesc='ECS Task Assistant tool'
url='https://github.com/fujiwara/ecsta'
license=('Apache')
arch=('aarch64' 'x86_64')
depends=()
conflicts=()
source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('0865cec735ba38e8fef70a67e55357393232b7f19950c740a06d10301ab74e27')
sha256sums_x86_64=('a74ec52534941b7117cc21248228c8bac60cbeecea036e76f31b72129455938c')

package() {
  install -Dm644 ${srcdir}/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 ${srcdir}/ecsta "$pkgdir/usr/bin/ecsta"
}

check() {
  ${srcdir}/ecsta version
}
