# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=beszel-hub-bin
pkgver=0.18.6
pkgrel=1
pkgdesc="Beszel Hub - system monitoring dashboard"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/henrygd/beszel"
license=('MIT')
provides=('beszel-hub')
conflicts=('beszel-hub')
backup=('etc/conf.d/beszel-hub')
source+=(
  'beszel-hub.service'
  'beszel-hub.sysusers'
  'beszel-hub.tmpfiles'
  'beszel-hub.conf'
)
sha256sums=('000d371656f3e72d721acf6e17fe78a13eb28940fa7e6df4d69b980de89aab07'
            '5a44b63b924cae957e00ba3c44b153a29c31407dd237040135538cdf9c82393f'
            '6eb2912ae29646ea5feb90339554da276217b8eb8751460dfadb1e8c2dc3d580'
            'b57bb1d2ee8b9321c7ded06527c3efa2083d16b5a6f265aacf1b01719ab22cc1')
sha256sums_x86_64=('93f3f57377e6f61a8262259c2eee4ab5dad4b062a1f4c45853684477d2ec66ed')
sha256sums_aarch64=('3dc4887d24afc9a210032b0b6ff46407d67e9b5f3334bb19f72989a780f7f0f0')
sha256sums_armv7h=('e88b1553333dc1bf58deb993bd7bac1a66ce64a0ff47a9cb2af386f619503006')

source_x86_64=("beszel_linux_amd64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/beszel_linux_amd64.tar.gz")
source_aarch64=("beszel_linux_arm64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/beszel_linux_arm64.tar.gz")
source_armv7h=("beszel_linux_arm-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/beszel_linux_arm.tar.gz")

package() {
  install -Dm0755 "${srcdir}"/beszel              "${pkgdir}"/usr/bin/beszel
  install -Dm0644 "${srcdir}"/LICENSE             "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  install -Dm0644 "${srcdir}"/beszel-hub.service  "${pkgdir}"/usr/lib/systemd/system/beszel-hub.service
  install -Dm0644 "${srcdir}"/beszel-hub.sysusers "${pkgdir}"/usr/lib/sysusers.d/beszel-hub.conf
  install -Dm0644 "${srcdir}"/beszel-hub.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/beszel-hub.conf
  install -Dm0640 "${srcdir}"/beszel-hub.conf     "${pkgdir}"/etc/conf.d/beszel-hub
}

