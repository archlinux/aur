# Maintainer: Daringcuteseal <daringcuteseal@gmail.com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=localxpose-cli
pkgver=latest
pkgrel=2
pkgdesc="A reverse proxy that enables you to expose your localhost to the internet (CLI)"
arch=('x86_64' 'i386' 'aarch64' 'armv7h')
url='https://localxpose.io'
license=("custom:${pkgname}")
provides=('localxpose')
depends=('glibc')
source=('LICENSE')
source_x86_64=("${pkgname}-${pkgver}-amd64.zst::https://loclx-client.s3.amazonaws.com/loclx-linux-amd64.pkg.tar.zst")
source_i386=("${pkgname}-${pkgver}-i368.zst::https://loclx-client.s3.amazonaws.com/loclx-linux-386.pkg.tar.zst")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zst::https://loclx-client.s3.amazonaws.com/loclx-linux-arm64.pkg.tar.zst")
source_armv7h=("${pkgname}-${pkgver}-armv7h.zst::https://loclx-client.s3.amazonaws.com/loclx-linux-arm.pkg.tar.zst")

sha256sums=('e2143fb751ce3e99d2f7e57edee8791fcba7011e2a685f29caac67c0cf5974ee')
sha256sums_x86_64=('03c6d1d35dfd0acb673473314c1384156ed2bfcb96e581b3e0bb398fef45fb88')
sha256sums_i386=('2534e0056ba5c1e4d55322b2b975a4945104604be15bef9df01c933ad4352804')
sha256sums_aarch64=('a423e0ce90fcab7044b4f0244fb8483fe12acf30361fff0e37d5abc2dae2da91')
sha256sums_armv7h=('83e5484169ea28f05fe221056374bbdaac129850b607bdc243326a06c22575e4')

package() {
  install -Dm755 "${srcdir}/usr/bin/loclx" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
