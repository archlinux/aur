pkgname='vault-bin'
pkgdesc='A tool for managing secrets'
pkgver='0.2.0'
pkgrel=2
url='https://vaultproject.io/'
license=('MPL')
arch=('i686' 'x86_64')
depends=('glibc')
conflicts=('vault' 'vault-git')
install='vault.install'
source=('vault.service'
        'vault.hcl'
        'LICENSE')
source_i686=("https://dl.bintray.com/mitchellh/vault/vault_${pkgver}_linux_386.zip")
source_x86_64=("https://dl.bintray.com/mitchellh/vault/vault_${pkgver}_linux_amd64.zip")
sha512sums=('a97d10208fd99b29cf532c9b5882fe1bbb3faee1d1d706f95a9c379fef461c65a9f16c8530438920024e69871ebd8c7329e6b65025ad65092950bfb74ce393b3'
            '8c064aa5dcca84822c1fa85e9d0ff520df46f794b2e9c689a9b4f81f74279387b3aebc08b3ca26cf786c2fcf1a330e765bf5a511074c24f87e5346672346ba1c'
            'dd6de68678d972517c135992217f625a3bc728a6495e1f6052df9926cf9cbc212dfa2a612be5a25d7ce5eeeef41e2b12f0d82af6176a6e0ca043b43c622c6347')
sha256sums_i686=('9a4cb5470182e163eaa9d2526beb60c6a215c931c15452065f8caa4aa5821816')
sha256sums_x86_64=('b4b64fcea765ebfc7cdbae9cdd2c32bff130ca51f15b9cf47194f112fd5515cf')

package () {
	install -Dm755 vault "${pkgdir}/usr/bin/vault"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/vault.hcl" "${pkgdir}/etc/vault.hcl"
	install -Dm644 "${srcdir}/vault.service" \
		"${pkgdir}/usr/lib/systemd/system/vault.service"
}
