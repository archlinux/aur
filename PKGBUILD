# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=beszel-hub-bin
pkgver=0.21.1
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
sha256sums_x86_64=('70857d0489cf790224167815c82f8807cc28134d27f209b58b1cd36e4082931a')
sha256sums_aarch64=('c2357b94d36febfd0c6df9f89f523fff6f6df69a4b8ac91a8b262d2b7fdb0584')
sha256sums_armv7h=('69508f85af0f2bbb4412bb220c66b40d186d94fc158f2396e76e296ddc5b9150')

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

