pkgname='bdf-zevv-peep'
pkgdesc='Monospace bitmap programming font aimed for FullHD displays'
pkgver='1'
pkgrel='1'
arch='any'
license=('MIT')
url='http://zevv.nl/play/code/zevv-peep/'
makedepends=('xorg-mkfontdir' 'xorg-mkfontscale')
source=("${url}/zevv-peep-iso8859-15-08x16.bdf"
        "${url}/zevv-peep-iso8859-15-10x20.bdf"
		"${url}/zevv-peep-iso8859-15-07x14.bdf")
sha512sums=('ac93bc7876d0a0e9314cef9955641b969b1b11d84085fc473e07747a7138caf67ad976fbc4b441fed6fa30d0bd56593d7951e1a4b34f560121bb9ac54a4ee3c0'
            'fc5e059de426089e5c62fa1668cedb50bd5bd88f78cbae991e4565c7d1683fdf6e2b4c509248536100dc94c341de8dff2a4dcfe71eb914b423fdcdd0f27ebd76'
            '3bca496d7d6b842defad32c5d574a5517b452cc487fc9f1658b516763b2ead5f367db74e5e89b7a0e72b1cae200d0d9b1f9bd0f3f55026a6b738ea0229b55dca')

package () {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/fonts/zevv-peep"
	for font in *.bdf ; do
		install -Dm644 "${font}" "${pkgdir}/usr/share/fonts/zevv-peep"
	done
	mkfontdir -- "${pkgdir}/usr/share/fonts/zevv-peep"
	mkfontscale -- "${pkgdir}/usr/share/fonts/zevv-peep"
}
