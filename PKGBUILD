# Maintainer: Bruno Silva <brunofernandes at ua dot pt>
# Co-Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=plugin-autenticacao-gov-pt
pkgver=2.1.00
pkgrel=1
pkgdesc="O plugin Autenticação.Gov (anteriormente designado por aplicação Autenticação.gov.pt) permite realizar o procedimento de autenticação com o Cartão de Cidadão sem necessidade de efetuar a instalação de qualquer componente no navegador"
arch=('any')
url=https://autenticacao.gov.pt/fa/ajuda/autenticacaogovpt.aspx
license=('custom:EUPL')
depends=('java-runtime' 'pcsclite' 'pcsc-tools' 'ccid')

source=("plugin-autenticacao-gov-pt.install"
        "${pkgname}-${pkgver}-${pkgrel}.deb::https://aplicacoes.autenticacao.gov.pt/plugin/plugin-autenticacao-gov.deb")

sha512sums=('b9e94b93c02bb483495438e085140743e918144de5d9b295dedc699e3e5c2603c78a3d8ff0437fc68be5013c99cc8b0e7436ade2bd077a5af1279b6ed0bf8374'
            'f7575b091f5c96bf7302105280fbb824f38bf39dd17b34c7f62969c3d0253b175bd0e1377aeedfaa316e9dd232a2fdc04e4dc8f5cdcdc564f26cd1c094176d3f')

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
