# Maintainer: Paul Stemmet <aur@luxolus.com>
pkgname=consul-template-bin
pkgver=0.32.0
pkgrel=1
pkgdesc="Template rendering, notifier, and supervisor for HashiCorp Consul and Vault data"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/hashicorp/consul-template"
license=('MPL2')
depends=('glibc')
provides=('consul-template')
conflicts=('consul-template')
backup=('etc/consul-template.d/example.hcl' 'usr/lib/systemd/system/consul-template@.service' 'usr/lib/systemd/system/consul-template.target')
changelog=CHANGELOG
source=('example.hcl' 'consul-template@.service' 'consul-template.target')
source_x86_64=(${pkgname}-${pkgver}.zip::https://releases.hashicorp.com/consul-template/${pkgver}/consul-template_${pkgver}_linux_amd64.zip)
source_i686=(${pkgname}-${pkgver}.zip::https://releases.hashicorp.com/consul-template/${pkgver}/consul-template_${pkgver}_linux_386.zip)
source_aarch64=(${pkgname}-${pkgver}.zip::https://releases.hashicorp.com/consul-template/${pkgver}/consul-template_${pkgver}_linux_arm64.zip)
sha256sums=('3e678bbc1818519df21741f41b9bc60fe13c1ae0f09b1b1f707e041130484268'
            '6fb7f113a9c529bcbeaec00835d86e6c99502848766c4286e6bc48c7f8a0a347'
            '91274ea60b8c8f8511427f9ff85a82d92c80755668bae11c2e3fd00dbf440a9c')
sha256sums_x86_64=('eda83e12a4618929a3ec0a49b11a2823b6201c9ae64e5a15161fd63313caf88b')
sha256sums_i686=('eda83e12a4618929a3ec0a49b11a2823b6201c9ae64e5a15161fd63313caf88b')
sha256sums_aarch64=('eda83e12a4618929a3ec0a49b11a2823b6201c9ae64e5a15161fd63313caf88b')

package() {

  install -Dm755 consul-template "${pkgdir}/usr/bin/consul-template"
  install -Dm644 "${srcdir}/example.hcl" "${pkgdir}/etc/consul-template.d/example.hcl"
  install -Dm644 "${srcdir}/consul-template@.service" "${pkgdir}/usr/lib/systemd/system/consul-template@.service"
  install -Dm644 "${srcdir}/consul-template.target" "${pkgdir}/usr/lib/systemd/system/consul-template.target"

}
