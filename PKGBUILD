pkgname='vault-bin'
pkgdesc='A tool for managing secrets'
pkgver='1.0.1'
pkgrel=1
url='https://vaultproject.io/'
license=('MPL')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
depends=('glibc')
conflicts=('vault' 'vault-git')
install='vault.install'
backup=('etc/vault.hcl')
source=('vault.service'
        'vault.hcl'
        'LICENSE')
source_i686=("https://releases.hashicorp.com/vault/${pkgver}/vault_${pkgver}_linux_386.zip")
source_x86_64=("https://releases.hashicorp.com/vault/${pkgver}/vault_${pkgver}_linux_amd64.zip")
source_armv7h=("https://releases.hashicorp.com/vault/${pkgver}/vault_${pkgver}_linux_arm.zip")
source_aarch64=("https://releases.hashicorp.com/vault/${pkgver}/vault_${pkgver}_linux_arm64.zip")
sha512sums=('a97d10208fd99b29cf532c9b5882fe1bbb3faee1d1d706f95a9c379fef461c65a9f16c8530438920024e69871ebd8c7329e6b65025ad65092950bfb74ce393b3'
            '8f8769f2c285f77b10c1f96e43acb233c70509ca657a8113f9d1f13a73ba55de6acdc6984597a4e1da19d6a7748e05f3523461a3b4bce10b9541aa5340400dd6'
            'dd6de68678d972517c135992217f625a3bc728a6495e1f6052df9926cf9cbc212dfa2a612be5a25d7ce5eeeef41e2b12f0d82af6176a6e0ca043b43c622c6347')
sha256sums_i686=('f1da84f6fc7684e3d276e4daecfbee42fc33f5de133648cb5b1f608510a24969')
sha256sums_x86_64=('1ea02627d0157dc844012995123f1cde86a02cb3b45030a9526057d12ee8d924')
sha256sums_armv7h=('4a1606ccda78ee7f68617a622ad0feccf3c20b7d305b3c0b812935aba94fab65')
sha256sums_aarch64=('3aea66df722bf7446b9f49976777ad44f98602ae2308e5188ed35871b999df77')

package () {
  install -Dm755 vault "${pkgdir}/usr/bin/vault"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/vault.hcl" "${pkgdir}/etc/vault.hcl"
  install -Dm644 "${srcdir}/vault.service" \
    "${pkgdir}/usr/lib/systemd/system/vault.service"
}
