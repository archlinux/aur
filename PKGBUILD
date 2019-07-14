# Maintainer: Michael
# Contributor: Michael
pkgname=dissenter-browser-bin
pkgver=0.66.99
pkgrel=1
pkgdesc="The free speech web browser. Browse faster by blocking ads and trackers that violate your privacy and cost you time and money."
arch=('x86_64')
url="https://dissenter.com"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'ttf-font')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support'
            'libgnome-keyring: Enable GNOME keyring support')
provides=('dissenter-browser')
options=('!strip' '!emptydirs')
source=("https://dissenter.com/dist/browser/$pkgver/dissenter-browser-v$pkgver-amd64.deb"
		"logo.png"
		"dissenter-browser-bin.sh"
		"dissenter-browser-bin.desktop"
		"LICENSE")
		
sha512sums=('578177e221ae6b3c862f3cb87d1fdfb7586f14b28f1bfe332fe48494cadd2f4cc9db2f15754c76617b20c0f430d6c4aa5ef00b846038fb555d5c24a653efc1f0'
			'1d39d98d29cc34511a0b77e7e6d770febe9a2ed621bba666c354a0fc4bdf9c4d9c29d18a4d0b5451cfba8fcac2f82519823790425da04f9d9dd4f24a90e24430'
			'1970e81599a32debec8ee76c6d8f32ee5374ce98f2b8a3a29f54eecdb7bee9242ead5ecaca913dfca17f9bbaba233f9ac3fc1c6fd0620224b893ef8edb9581fe'
			'b569ec9a7d4697b05de7e2de06ab3b3139ec7a7d5a6ae33cfd199e65afa9a47c91e5ef80e85575bbf24cec105c180e9a288a9a18752d700e5e1ca1f9b7074050'
			'94475d361cdf698fcdea77ad11c10fb4bb579b34cb371c8b066db47edf7e5622b41c599c9f018f4031c7c7f41224f36774b60665293a98dff7bd863980a94dbb')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	rm ${pkgdir}/usr/share/applications/dissenter-browser.desktop
	
	install -Dm0755 "${pkgname}.sh" "$pkgdir/usr/bin/dissenter-browser"
	install -Dm0644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
	install -Dm0644 "logo.png" "${pkgdir}/usr/share/pixmaps/dissenter.png"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	
}

