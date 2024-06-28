# Maintainer: Bruno Silva <brunofernandes at ua dot pt>
# Co-Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=plugin-autenticacao-gov-pt
pkgver=2.0.92
pkgrel=1
pkgdesc="O plugin Autenticação.Gov (anteriormente designado por aplicação Autenticação.gov.pt) permite realizar o procedimento de autenticação com o Cartão de Cidadão sem necessidade de efetuar a instalação de qualquer componente no navegador"
arch=('any')
url=https://autenticacao.gov.pt/fa/ajuda/autenticacaogovpt.aspx
license=('custom:EUPL')
depends=('java-runtime' 'pcsclite' 'pcsc-tools' 'ccid')

source=("plugin-autenticacao-gov-pt.install" "https://aplicacoes.autenticacao.gov.pt/plugin/plugin-autenticacao-gov.deb")

sha512sums=('b9e94b93c02bb483495438e085140743e918144de5d9b295dedc699e3e5c2603c78a3d8ff0437fc68be5013c99cc8b0e7436ade2bd077a5af1279b6ed0bf8374'
            'c688cea306e7f77b15e97723942583182b853f617374d53a12d3588dad5a3c8812a10409e105517a6c5bee7f8bec65591d455dcf5b7b5041b6bf7732082d4855')

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
