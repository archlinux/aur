# Maintainer: Paul Stemmet <aur@luxolus.com>
pkgname=consul-template-bin
pkgver=0.37.2
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
sha256sums_x86_64=('9b416cce00d301f1882ca817424e4cb99e37ad630fdb4c06b5ff5274ebc24c8a')
sha256sums_i686=('9b416cce00d301f1882ca817424e4cb99e37ad630fdb4c06b5ff5274ebc24c8a')
sha256sums_aarch64=('9b416cce00d301f1882ca817424e4cb99e37ad630fdb4c06b5ff5274ebc24c8a')

package() {

  install -Dm755 consul-template "${pkgdir}/usr/bin/consul-template"
  install -Dm644 "${srcdir}/example.hcl" "${pkgdir}/etc/consul-template.d/example.hcl"
  install -Dm644 "${srcdir}/consul-template@.service" "${pkgdir}/usr/lib/systemd/system/consul-template@.service"
  install -Dm644 "${srcdir}/consul-template.target" "${pkgdir}/usr/lib/systemd/system/consul-template.target"

}
