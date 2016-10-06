pkgname='vault-bin'
pkgdesc='A tool for managing secrets'
pkgver='0.6.2'
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
sha256sums_i686=('85ca9e2d09e49089c76f00686d7914c840a2cbec0d18bf6429dc396265f7a730')
sha256sums_x86_64=('91432c812b1264306f8d1ecf7dd237c3d7a8b2b6aebf4f887e487c4e7f69338c')
sha256sums_armv7h=('efc36dcb2044cf4c80af9e71abd9fb4716db8944e7d102f913d17f922a527189')

package () {
	install -Dm755 vault "${pkgdir}/usr/bin/vault"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/vault.hcl" "${pkgdir}/etc/vault.hcl"
	install -Dm644 "${srcdir}/vault.service" \
		"${pkgdir}/usr/lib/systemd/system/vault.service"
}
