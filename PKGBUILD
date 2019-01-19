# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: reflexing <reflexing@reflexing.ru>
# Contributor: Alexander Zubkov <green@msu.ru>
# Contributor: nsf

pkgname=ttf-paratype
pkgver=2.005
pkgrel=1
epoch=1
pkgdesc='ParaType font family with extended cyrillic and latin character sets'
arch=('any')
url='https://company.paratype.com/pt-sans-pt-serif'
license=('custom:OFL')

provides=(
	'ttf-font'
	'ttf-pt-sans'
	'ttf-pt-sans-expert'
	'ttf-pt-serif'
	'ttf-pt-serif-expert'
	'ttf-pt-mono'
)

# Fix curl
# https://bbs.archlinux.org/viewtopic.php?pid=1340708#p1340708
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

source=(
	# PT Sans
	'https://company.paratype.com/system/attachments/629/original/ptsans.zip'
	'https://company.paratype.com/system/attachments/632/original/ptsansexpert.zip'

	# PT Serif
	'https://company.paratype.com/system/attachments/634/original/ptserif.zip'
	'https://company.paratype.com/system/attachments/635/original/ptserifexpert.zip'

	# PT Mono
	'https://company.paratype.com/system/attachments/631/original/ptmono.zip'
)
sha512sums=(
	# PT Sans
	'1fc836b60d226a2d21c3d03b4e4565e38031395256002ae1194f50d6053243ea3467a8702a17bca1ca17d0927549ddce96a45f27e55773b1810ae4a77cc8c319'
	'610e8aa80edb6f20d9ae5c534ea81b84b7207abdb2f698089ae41d7f838bf06d19680ae9646a9aff1b466b2fa339709a942a7de458f5ce3b9076a40a0d1b2f4f'

	# PT Serif
	'3f779f2776e38c91bfaa364412e7cb82c730a5a8a98cb747a4d50574f187392167d3587810a9eb6129952843ae1007c7e485fa35367609974eff3b5217099eb8'
	'19edff4885026045eb32a97ddb2a5724b3fd5034d6bb34a18529ae9497f99b32351256db15febe1fe002717f3691eb8a643f90669278386451922b4ba2252c34'

	# PT Mono
	'479f2c9067bd5631d9ac6ad61a91add41a99c2acdfec173386754891f6c8b6d78d4ec16bac73caaf816f751fa70857a7836a3733a35e3048d85f84c1ea9d734f'
)

package() {
	# Create required directories
	mkdir -p \
		"${pkgdir}"/usr/share/fonts/TTF/ \
		"${pkgdir}"/usr/share/licenses/${pkgname}/

	# Install font files
	cp "${srcdir}"/*.ttf "${pkgdir}"/usr/share/fonts/TTF/

	# Install license
	cp "${srcdir}"/PT_FreeLicense_E.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
