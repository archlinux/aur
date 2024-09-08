# Maintainer: Bruno Silva <brunofernandes at ua dot pt>
# Co-Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=plugin-autenticacao-gov-pt
pkgver=2.0.97
pkgrel=2
pkgdesc="O plugin Autenticação.Gov (anteriormente designado por aplicação Autenticação.gov.pt) permite realizar o procedimento de autenticação com o Cartão de Cidadão sem necessidade de efetuar a instalação de qualquer componente no navegador"
arch=('any')
url=https://autenticacao.gov.pt/fa/ajuda/autenticacaogovpt.aspx
license=('custom:EUPL')
depends=('java-runtime' 'pcsclite' 'pcsc-tools' 'ccid')

source=("plugin-autenticacao-gov-pt.install" "${pkgname}-${pkgver}-${pkgrel}.deb::https://aplicacoes.autenticacao.gov.pt/plugin/plugin-autenticacao-gov.deb")

sha512sums=('b9e94b93c02bb483495438e085140743e918144de5d9b295dedc699e3e5c2603c78a3d8ff0437fc68be5013c99cc8b0e7436ade2bd077a5af1279b6ed0bf8374'
            '5774943b7c6370552beb76b7d992b2d3cb933bb16217c838a668cba89c85607d8ac671d6afc664799fbe81d2b5c1b798c9c1c81d87ebf0abb5464909c4876a33')

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
