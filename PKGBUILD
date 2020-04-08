# Maintainer: Bruno Silva <brunofernandes at ua dot pt>
# Co-Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=plugin-autenticacao-gov-pt
pkgver=2.0.46
pkgrel=1
pkgdesc="O plugin Autenticação.Gov (anteriormente designado por aplicação Autenticação.gov.pt) permite realizar o procedimento de autenticação com o Cartão de Cidadão sem necessidade de efetuar a instalação de qualquer componente no navegador"
arch=('any')
url=https://autenticacao.gov.pt/fa/ajuda/autenticacaogovpt.aspx
license=('custom:EUPL')
depends=('java-runtime' 'pcsclite' 'pcsc-tools' 'ccid')

source=("plugin-autenticacao-gov-pt.install" "https://autenticacao.gov.pt/fa/ajuda/software/plugin-autenticacao-gov.deb")

sha512sums=('bf6d104a7ad426e58922071165f8ab27f39f1a1e169b2c0dc082fdd46402406aac39190cc185ab6ace9e144c447a2ad37487c73650ab0a04d6a9fb4d5eb3f5af'
            '64aaf0e567e96cda1819e0108aac989fb8d92947d4fac52b525f592cfc4b8e625a2343b9c0568de336873a2ca952412e35f9196d470c0ed9f465c4a2a679dcc7')

install='plugin-autenticacao-gov-pt.install'

prepare() {
	tar -zxf data.tar.gz
}

package() {
	# Place license on the correct place
	mkdir -p ${srcdir}/usr/share/licenses/plugin-autenticacao-gov-pt/
	mv ${srcdir}/usr/share/doc/plugin-autenticacao-gov/copyright ${srcdir}/usr/share/licenses/plugin-autenticacao-gov-pt/LICENSE

	# Move everything to install dir
	cp -r ${srcdir}/usr* ${pkgdir}
}
