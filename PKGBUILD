# Contributor: AkiraYB <brunoyb!outlook,com>
# Maintainer: Davi da Silva Böger <dsboger@gmail.com>

pkgname=mythes-pt-br
pkgver=20100528
pkgrel=4
pkgdesc='Portuguese (Brazil) thesaurus'
arch=('any')
url='http://extensions.services.openoffice.org/en/node/6213'
license=('unknown')
optdepends=('libmythes: offers thesaurus library functions')
source=('http://downloads.sourceforge.net/project/aoo-extensions/6212/0/dicsin-br.oxt')
sha256sums=('0663f9ba720647499ef7d6960e5c7d3b2ee022cc47a933b121dbdbefd2abc2f4')

package()
{
	cd "$srcdir"

	local _mythesdir="${pkgdir}/usr/share/mythes"
	local _dictsdir="${pkgdir}/usr/share/myspell/dicts"
	local _docdir="${pkgdir}/usr/share/doc/${pkgname}"

	install -d "$_mythesdir" "$_dictsdir" "$_docdir"

	install -m 644 th_pt_BR.dat "${_mythesdir}/th_pt_BR_v2.dat"
	install -m 644 th_pt_BR.idx "${_mythesdir}/th_pt_BR_v2.idx"

	for _file in "$_mythesdir"/*
	do
		ln -sv "${_file#${pkgdir}}" "${_dictsdir}"
	done

	install -m 644 readme.txt "$_docdir"
}
