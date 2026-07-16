pkgname=noi_arbiter-bin
_ver=2.0
pkgver=${_ver}
pkgrel=1
pkgdesc="Arbiter is used to judge problems in NOI. Written by CCF."
arch=('x86_64')
url="https://www.noi.cn/gynoi/jsgz/2021-07-16/732450.shtml"
license=('unknown')
depends=('bash')
options=(!debug)
source=("https://www.codemaze.dev/arbiter.tar.gz"
        "arbiter_local.png"
        "run.sh"
        "arbiter.desktop")
sha256sums=("922d3de52bf4f0842d1d15feb83396e784486e8dbdba6f607fb958cf11f981e0"
            "d74bbf3e6b4cc23bc61e4ac2826659e1fc40b9f812b7eb5e0ea65bc9c6ff6f9a"
            "e4c0d030a8439597897fa87e29fc730e527efc0f799c4f3faabde5ab6a117cc9"
            "b7461be4a8bdfc02cf7d60471a267419698f7d8f7a5559327b3f037f66e4dd14")

package(){
	install -Dm755 "arbiter/local/arbiter_local" "${pkgdir}/usr/bin/${pkgname}2/${pkgname}"
	install -Dm644 "arbiter.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "arbiter_local.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"

	mkdir -p "${pkgdir}/usr/bin/${pkgname}2/filter/"
	cp -rf "arbiter/local/filter/"* "${pkgdir}/usr/bin/${pkgname}2/filter/"
	chmod 755 "${pkgdir}/usr/bin/${pkgname}2/filter/"*

	install -Dm755 "run.sh" "${pkgdir}/usr/bin/${pkgname}" 
}
