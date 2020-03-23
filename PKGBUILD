# Maintainer: Michael
# Contributor: Michael
pkgname=dissenter-browser-bin
pkgver=1.5.114
pkgrel=1
pkgdesc="The free speech web browser. Browse faster by blocking ads and trackers that violate your privacy and cost you time and money."
arch=('x86_64')
url="https://dissenter.com"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'ttf-font')
optdepends=('cups: Printer support'
            'libgnome-keyring: Enable GNOME keyring support')
provides=('dissenter-browser')
options=('!strip' '!emptydirs')
source=("https://github.com/gab-ai-inc/defiant-browser/releases/download/v$pkgver/dissenter-browser_${pkgver}_amd64.deb"
		"logo.png"
		"dissenter-browser-bin.sh"
		"dissenter-browser-bin.desktop"
		"LICENSE")
		
sha512sums=('f53eb91bf76a382028948f14b866cf72c745975bb05390d1b7b45fdfdb4d7c96ada4d014327b658ed01259a5f4171600958291eb8791a7c5346f5c1f9db79db4'
			'1d39d98d29cc34511a0b77e7e6d770febe9a2ed621bba666c354a0fc4bdf9c4d9c29d18a4d0b5451cfba8fcac2f82519823790425da04f9d9dd4f24a90e24430'
			'fb9a07e37fe564f8006020840f518aaf6a0da97da1f88db325d2a5dc3689171e46e4d49f089a32d96eec47a3b0218f4ad93a31012208d049b63732ae6afdbbb1'
			'b569ec9a7d4697b05de7e2de06ab3b3139ec7a7d5a6ae33cfd199e65afa9a47c91e5ef80e85575bbf24cec105c180e9a288a9a18752d700e5e1ca1f9b7074050'
			'94475d361cdf698fcdea77ad11c10fb4bb579b34cb371c8b066db47edf7e5622b41c599c9f018f4031c7c7f41224f36774b60665293a98dff7bd863980a94dbb')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	rm ${pkgdir}/usr/share/applications/dissenter-browser.desktop
	rm ${pkgdir}/usr/bin/dissenter-browser-stable
	
	install -Dm0755 "${pkgname}.sh" "$pkgdir/usr/bin/dissenter-browser"
	install -Dm0644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
	install -Dm0644 "logo.png" "${pkgdir}/usr/share/pixmaps/dissenter.png"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	
}


