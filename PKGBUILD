# Maintainer: Michael
# Contributor: Michael
pkgname=dissenter-browser-bin
pkgver=0.67.13
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
		
sha512sums=('83b2bf03edb5adf3ad88263a3d0e9d033130ff72a0001acbc1cfb32f486a180a02fa4459c1471c15cf6327616b90e4bb6cb3898e1c8ca5b36feffbb7ae8d6241'
			'1d39d98d29cc34511a0b77e7e6d770febe9a2ed621bba666c354a0fc4bdf9c4d9c29d18a4d0b5451cfba8fcac2f82519823790425da04f9d9dd4f24a90e24430'
			'f5204697a819aee0b616b05e81611bb87cd8d723e2b91817ff0943ca7a90f1ce2bfac2e187badec50de3be66241c1d9c019297320ca65bee71b0fe41d32565b9'
			'64300c7ce2e2ed1e2731091a337f4fb2c8f9ca4da66696ab8207c30b27affeb31b927bfc29fab82662a6740b556b3e2d9bb6bf44d73668f03d73340acea152c2'
			'94475d361cdf698fcdea77ad11c10fb4bb579b34cb371c8b066db47edf7e5622b41c599c9f018f4031c7c7f41224f36774b60665293a98dff7bd863980a94dbb')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	
	install -Dm0755 "${pkgname}.sh" "$pkgdir/usr/bin/dissenter-browser"
	install -Dm0644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
	install -Dm0644 "logo.png" "${pkgdir}/usr/share/pixmaps/dissenter.png"
	rm ${pkgdir}/usr/share/applications/dissenter-browser.desktop
	rm ${pkgdir}/usr/bin/dissenter-browser-stable
}
