# Maintainer: Paul Stemmet <aur@luxolus.com>
pkgname=consul-template-bin
pkgver=0.27.1
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
sha256sums=(3e678bbc1818519df21741f41b9bc60fe13c1ae0f09b1b1f707e041130484268 6fb7f113a9c529bcbeaec00835d86e6c99502848766c4286e6bc48c7f8a0a347 91274ea60b8c8f8511427f9ff85a82d92c80755668bae11c2e3fd00dbf440a9c)
sha256sums_x86_64=(db340b7555105d004caf8fad10e1d53ee0bd2320572c4560387279e92490f807)
sha256sums_i686=(0f2f1db2bac85a0ff7e0a3bc951b362f6bd97cf06d2fc0fecdba70a3881c1950)
sha256sums_aarch64=(210ddabf1c02e0cc45ceaf0d0e0918a33704ea6c20fa9de8b5e3806e3dd35729)

package() {

  install -Dm755 consul-template "${pkgdir}/usr/bin/consul-template"
  install -Dm644 "${srcdir}/example.hcl" "${pkgdir}/etc/consul-template.d/example.hcl"
  install -Dm644 "${srcdir}/consul-template@.service" "${pkgdir}/usr/lib/systemd/system/consul-template@.service"
  install -Dm644 "${srcdir}/consul-template.target" "${pkgdir}/usr/lib/systemd/system/consul-template.target"

}
