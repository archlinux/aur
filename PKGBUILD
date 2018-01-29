pkgname='vault-bin'
pkgdesc='A tool for managing secrets'
pkgver='0.9.3'
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
sha256sums_i686=('d37834916716c9d71fba9c703fd2b69f3de037175a789c85c412ecb0810d10ac')
sha256sums_x86_64=('4ba8b9dafb903d20b4c87e8954015a07a6995f53a9650ac02b39e6cae502645e')
sha256sums_armv7h=('1e5b658fb6416560cf6b283d39e9a9ac06d618484f8345ca8f049a93a1e7283c')
sha256sums_aarch64=('cc5b20f0d5707eb5cb81167007dd69dd769dea9b9a233b880230a33a7cb10d12')

package () {
  install -Dm755 vault "${pkgdir}/usr/bin/vault"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/vault.hcl" "${pkgdir}/etc/vault.hcl"
  install -Dm644 "${srcdir}/vault.service" \
    "${pkgdir}/usr/lib/systemd/system/vault.service"
}
