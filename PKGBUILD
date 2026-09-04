# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=beszel-hub-bin
pkgver=0.19.0
pkgrel=1
pkgdesc="System monitoring dashboard"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/henrygd/beszel"
license=('MIT')
provides=('beszel-hub')
conflicts=('beszel-hub')
backup=('etc/conf.d/beszel-hub')
source+=(
  'beszel-hub.service'
  'beszel-hub.sysusers'
  'beszel-hub.conf'
)
sha256sums=('237e832c47ebb4017228a3c41f552c62a9a77b4f9b5e115df649e57d9e4584ce'
            '48d839334dc6b43a5b177d524ffe74d2f91f691efb37f97f59b4c1c8d381a1b7'
            'b57bb1d2ee8b9321c7ded06527c3efa2083d16b5a6f265aacf1b01719ab22cc1')
sha256sums_x86_64=('63b20d6ca328dc08e588126da2e13f8bece6ae875de5f25a058f48cb6ea19998')
sha256sums_aarch64=('303f144f865a24b95b539740222dc65dc376b25526c8430eb5b093f3759e337c')
sha256sums_armv7h=('ac021f786fc966149756b6a50628e68cadb18e2ca8ca016523f64866a7748c00')

source_x86_64=("beszel_linux_amd64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/beszel_linux_amd64.tar.gz")
source_aarch64=("beszel_linux_arm64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/beszel_linux_arm64.tar.gz")
source_armv7h=("beszel_linux_arm-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/beszel_linux_arm.tar.gz")

package() {
  install -Dm0755 "${srcdir}"/beszel              "${pkgdir}"/usr/bin/beszel
  install -Dm0644 "${srcdir}"/LICENSE             "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  install -Dm0644 "${srcdir}"/beszel-hub.service  "${pkgdir}"/usr/lib/systemd/system/beszel-hub.service
  install -Dm0644 "${srcdir}"/beszel-hub.sysusers "${pkgdir}"/usr/lib/sysusers.d/beszel-hub.conf
  install -Dm0640 "${srcdir}"/beszel-hub.conf     "${pkgdir}"/etc/conf.d/beszel-hub
}

