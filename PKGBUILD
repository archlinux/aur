# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=autenticacao-gov-pt
pkgver=2.0.11
pkgrel=1
pkgdesc="O Autenticação.gov.pt é o mecanismo que permite utilizar o Cartão de Cidadão eficientemente e em segurança nos navegadores que suportem ou não plugins Java"
arch=('any')
url="http://autenticacao.gov.pt/"
license=('custom:EUPL')
depends=('java-runtime' 'pcsclite' 'pcsc-tools' 'ccid')

source=("autenticacao-gov-pt.install" "https://autenticacao.gov.pt/fa/ajuda/software/autenticacao.gov.pt.deb")

sha1sums=('5ab9a56047d7c28f4797462d67d8c0045e74f7cd'
          '8365b0f7c35a6e820eae0d752d9721a324ed80ec')

install='autenticacao-gov-pt.install'

prepare() {
	tar -zxf data.tar.gz
}

package() {
	# Place license on the correct place
	mkdir -p ${srcdir}/usr/share/licenses/autenticacao-gov-pt/
	mv ${srcdir}/usr/share/doc/autenticacao-gov-pt/copyright ${srcdir}/usr/share/licenses/autenticacao-gov-pt/LICENSE

	# Move everything to install dir
	cp -r ${srcdir}/usr* ${pkgdir}
}
