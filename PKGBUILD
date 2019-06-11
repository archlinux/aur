# Maintainer: Michael
# Contributor: Michael
pkgname=dissenter-browser-bin
pkgver=0.65.118
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
		
sha512sums=('7e0f8a1a58d1d0a416634319c72bda8e94ef5e48b9d0f7b0c859a0e6cf7b96c7fa8ce9181d40eeffc0e5047e29d6aab2d123ec113187eb7dc847b70ff44d1f08'
			'1d39d98d29cc34511a0b77e7e6d770febe9a2ed621bba666c354a0fc4bdf9c4d9c29d18a4d0b5451cfba8fcac2f82519823790425da04f9d9dd4f24a90e24430'
			'f5204697a819aee0b616b05e81611bb87cd8d723e2b91817ff0943ca7a90f1ce2bfac2e187badec50de3be66241c1d9c019297320ca65bee71b0fe41d32565b9'
			'64300c7ce2e2ed1e2731091a337f4fb2c8f9ca4da66696ab8207c30b27affeb31b927bfc29fab82662a6740b556b3e2d9bb6bf44d73668f03d73340acea152c2'
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

