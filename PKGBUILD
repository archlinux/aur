pkgname='vault-bin'
pkgdesc='A tool for managing secrets'
pkgver='0.6.1'
pkgrel=1
url='https://vaultproject.io/'
license=('MPL')
arch=('i686' 'x86_64' 'armv7h')
depends=('glibc')
conflicts=('vault' 'vault-git')
install='vault.install'
source=('vault.service'
        'vault.hcl'
        'LICENSE')
source_i686=("https://releases.hashicorp.com/vault/${pkgver}/vault_${pkgver}_linux_386.zip")
source_x86_64=("https://releases.hashicorp.com/vault/${pkgver}/vault_${pkgver}_linux_amd64.zip")
source_armv7h=("https://releases.hashicorp.com/vault/${pkgver}/vault_${pkgver}_linux_arm.zip")
sha512sums=('a97d10208fd99b29cf532c9b5882fe1bbb3faee1d1d706f95a9c379fef461c65a9f16c8530438920024e69871ebd8c7329e6b65025ad65092950bfb74ce393b3'
            '8f8769f2c285f77b10c1f96e43acb233c70509ca657a8113f9d1f13a73ba55de6acdc6984597a4e1da19d6a7748e05f3523461a3b4bce10b9541aa5340400dd6'
            'dd6de68678d972517c135992217f625a3bc728a6495e1f6052df9926cf9cbc212dfa2a612be5a25d7ce5eeeef41e2b12f0d82af6176a6e0ca043b43c622c6347')
sha256sums_i686=('c32231a7670f14489d1795d497edaa44c793eab42a4b3b2a74c8f8c877871520')
sha256sums_x86_64=('4f248214e4e71da68a166de60cc0c1485b194f4a2197da641187b745c8d5b8be')
sha256sums_armv7h=('a3016e9acefc8af930b0ca855e6a995b164c6756f3f036e406faa6af71331669')

package () {
	install -Dm755 vault "${pkgdir}/usr/bin/vault"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/vault.hcl" "${pkgdir}/etc/vault.hcl"
	install -Dm644 "${srcdir}/vault.service" \
		"${pkgdir}/usr/lib/systemd/system/vault.service"
}
