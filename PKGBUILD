pkgname='vault-bin'
pkgdesc='A tool for managing secrets'
pkgver='0.6.5'
pkgrel=2
url='https://vaultproject.io/'
license=('MPL')
arch=('i686' 'x86_64' 'armv7h')
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
sha512sums=('a97d10208fd99b29cf532c9b5882fe1bbb3faee1d1d706f95a9c379fef461c65a9f16c8530438920024e69871ebd8c7329e6b65025ad65092950bfb74ce393b3'
            '8f8769f2c285f77b10c1f96e43acb233c70509ca657a8113f9d1f13a73ba55de6acdc6984597a4e1da19d6a7748e05f3523461a3b4bce10b9541aa5340400dd6'
            'dd6de68678d972517c135992217f625a3bc728a6495e1f6052df9926cf9cbc212dfa2a612be5a25d7ce5eeeef41e2b12f0d82af6176a6e0ca043b43c622c6347')
sha256sums_i686=('85dd505f57964add2359798faca0302877b95386a852331bb0e7d43367a41949')
sha256sums_x86_64=('c9d414a63e9c4716bc9270d46f0a458f0e9660fd576efb150aede98eec16e23e')
sha256sums_armv7h=('b97e4da703b93870a614c53431da905029dbb54675f404f6a878536a1852fecf')

package () {
	install -Dm755 vault "${pkgdir}/usr/bin/vault"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/vault.hcl" "${pkgdir}/etc/vault.hcl"
	install -Dm644 "${srcdir}/vault.service" \
		"${pkgdir}/usr/lib/systemd/system/vault.service"
}
