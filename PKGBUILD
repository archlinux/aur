pkgname='vault-bin'
pkgdesc='A tool for managing secrets'
pkgver='0.10.3'
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
sha256sums_i686=('87cba10d831107f70cd3348f2041e460645154913300c7f9e85d9eda99ce4687')
sha256sums_x86_64=('ffec1c201f819f47581f54c08653a8d17ec0a6699854ebd7f6625babb9e290ed')
sha256sums_armv7h=('91f893bb34cd19890181278a655368dde898e532d3a381b26fab78ab3cce12ba')
sha256sums_aarch64=('9a493cce9ab501a324664b0ce659b5b8ec7666455e936f96709810c9d27a1903')

package () {
  install -Dm755 vault "${pkgdir}/usr/bin/vault"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/vault.hcl" "${pkgdir}/etc/vault.hcl"
  install -Dm644 "${srcdir}/vault.service" \
    "${pkgdir}/usr/lib/systemd/system/vault.service"
}
