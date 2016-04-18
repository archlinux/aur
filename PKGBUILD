pkgname='vault-bin'
pkgdesc='A tool for managing secrets'
pkgver='0.5.2'
pkgrel=1
url='https://vaultproject.io/'
license=('MPL')
arch=('i686' 'x86_64')
depends=('glibc')
conflicts=('vault' 'vault-git')
install='vault.install'
source=('vault.service'
        'vault.hcl'
        'LICENSE')
source_i686=("https://releases.hashicorp.com/vault/${pkgver}/vault_${pkgver}_linux_386.zip")
source_x86_64=("https://releases.hashicorp.com/vault/${pkgver}/vault_${pkgver}_linux_amd64.zip")
sha512sums=('a97d10208fd99b29cf532c9b5882fe1bbb3faee1d1d706f95a9c379fef461c65a9f16c8530438920024e69871ebd8c7329e6b65025ad65092950bfb74ce393b3'
            '8f8769f2c285f77b10c1f96e43acb233c70509ca657a8113f9d1f13a73ba55de6acdc6984597a4e1da19d6a7748e05f3523461a3b4bce10b9541aa5340400dd6'
            'dd6de68678d972517c135992217f625a3bc728a6495e1f6052df9926cf9cbc212dfa2a612be5a25d7ce5eeeef41e2b12f0d82af6176a6e0ca043b43c622c6347')
sha256sums_i686=('8305303aa9f4a0654961d0930d40bc61b3a0ad52e12d630e1619815de196e9fc')
sha256sums_x86_64=('7517b21d2c709e661914fbae1f6bf3622d9347b0fe9fc3334d78a01d1e1b4ec2')

package () {
	install -Dm755 vault "${pkgdir}/usr/bin/vault"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/vault.hcl" "${pkgdir}/etc/vault.hcl"
	install -Dm644 "${srcdir}/vault.service" \
		"${pkgdir}/usr/lib/systemd/system/vault.service"
}
