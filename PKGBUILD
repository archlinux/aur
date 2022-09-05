# Maintainer: Isaac Ganoung <inventor500@vivaldi.net>
_lang=eng-jpn
pkgname=dict-freedict-${_lang}
pkgver=0.06
pkgrel=2022.04
pkgdesc="English -> Japanese dictionary for dict et al. from Freedict.org"
arch=('any')
url="https://freedict.org"
license=('CCPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd')
install=${pkgname}.install
source=('https://download.freedict.org/dictionaries/eng-jpn/2022.04.06/freedict-eng-jpn-2022.04.06.dictd.tar.xz')
sha512sums=('c7849529338ece587ae99cadd33fa8408be9a7c6bf16365efaf2aba644255a28482326c90869946613623df5f78e7b793afd3aea68b4ce9a3b9b36c76856bbf8')

package() {
	install -m 755 -d "${pkgdir}/usr/share/dictd"
	install -m 644 -t "${pkgdir}/usr/share/dictd/" ${_lang}/${_lang}.{dict.dz,index}
	for file in ${_lang}/{AUTHORS,README,NEWS,ChangeLog}
	do
		if test -f ${file}
		then
			install -m 644 -Dt "${pkgdir}/usr/share/doc/freedict/${_lang}/" ${file}
		fi
	done
}
