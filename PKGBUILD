# Maintainer: Paul Stemmet <aur@luxolus.com>
pkgname=consul-template-bin
pkgver=0.25.2
pkgrel=1
pkgdesc="Template rendering, notifier, and supervisor for HashiCorp Consul and Vault data"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
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
source_armv7h=(${pkgname}-${pkgver}.zip::https://releases.hashicorp.com/consul-template/${pkgver}/consul-template_${pkgver}_linux_arm.zip)
source_aarch64=(${pkgname}-${pkgver}.zip::https://releases.hashicorp.com/consul-template/${pkgver}/consul-template_${pkgver}_linux_arm64.zip)
sha256sums=(3e678bbc1818519df21741f41b9bc60fe13c1ae0f09b1b1f707e041130484268 6fb7f113a9c529bcbeaec00835d86e6c99502848766c4286e6bc48c7f8a0a347 91274ea60b8c8f8511427f9ff85a82d92c80755668bae11c2e3fd00dbf440a9c)
sha256sums_x86_64=(9edf7cd9dfa0d83cd992e5501a480ea502968f15109aebe9ba2203648f3014db)
sha256sums_i686=(be13e676c5ae8c9de436e418f38aa092f221eec6c59e05dabd1c4959956eeb8f)
sha256sums_armv7h=(dc6ac0508dded2b39544dfefb80ebe907c820e72654a4f052d93d1272b079b3c)
sha256sums_aarch64=(54e973bf4cca8e860ba44d2ce762f2a69bbb5def7da3056566b9963226e87157)

package() {

  install -Dm755 consul-template "${pkgdir}/usr/bin/consul-template"
  install -Dm644 "${srcdir}/example.hcl" "${pkgdir}/etc/consul-template.d/example.hcl"
  install -Dm644 "${srcdir}/consul-template@.service" "${pkgdir}/usr/lib/systemd/system/consul-template@.service"
  install -Dm644 "${srcdir}/consul-template.target" "${pkgdir}/usr/lib/systemd/system/consul-template.target"

}
