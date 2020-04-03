# Maintainer: Michael
# Contributor: Michael
pkgname=dissenter-browser-bin
pkgver=1.5.114
pkgrel=2
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
			'e099b284b2e1c5492d236dba7d0b36ef5ee6cb35af0b2f1635a32520a0288e303b91f79293de644200612f17404794110d0962751ac3dd83656ebe03cfb2d7da'
			'2aa22135d333b128cb48a7669dc9ed532a3ea5f9b6c33e0ca4a90f48af8166873b1f67485bbe8ffe4b07a1ee90b858a4e1ef6181080fd4aa9a759734cd4728ce'
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


