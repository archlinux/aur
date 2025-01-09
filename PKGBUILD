pkgname=otb-zevv-peep
pkgdesc='Monospace bitmap programming font aimed for FullHD displays'
pkgver=1
pkgrel=2
arch=(any)
license=(MIT)
url=https://github.com/Tecate/bitmap-fonts
makedepends=(xorg-fonttosfnt)
_dlurl="$url/raw/5c101c91bf2ed0039aad02f9bf76ddb2018b1f21/bitmap/zevv-peep"
source=("${_dlurl}/zevv-peep-iso8859-15-08x16.bdf"
        "${_dlurl}/zevv-peep-iso8859-15-10x20.bdf"
        "${_dlurl}/zevv-peep-iso8859-15-07x14.bdf")
sha512sums=(ac93bc7876d0a0e9314cef9955641b969b1b11d84085fc473e07747a7138caf67ad976fbc4b441fed6fa30d0bd56593d7951e1a4b34f560121bb9ac54a4ee3c0
            fc5e059de426089e5c62fa1668cedb50bd5bd88f78cbae991e4565c7d1683fdf6e2b4c509248536100dc94c341de8dff2a4dcfe71eb914b423fdcdd0f27ebd76
            3bca496d7d6b842defad32c5d574a5517b452cc487fc9f1658b516763b2ead5f367db74e5e89b7a0e72b1cae200d0d9b1f9bd0f3f55026a6b738ea0229b55dca)

build () {
	cd "${srcdir}"
	fonttosfnt -v -o zevv-peep.otb -- *.bdf
}

package () {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/fonts/zevv-peep"
	install -Dm644 zevv-peep.otb "${pkgdir}/usr/share/fonts/zevv-peep"
}
