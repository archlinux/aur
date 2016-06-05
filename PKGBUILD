# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=drumpulous
pkgver=1
pkgrel=3
arch=('i686' 'x86_64')
url="https://drumpulous.itch.io/drumpulous"
license=('Unknown')
pkgdesc="Shoot dildos at Donald Trump's head"
depends=('bash')
source=("https://drumpulous.itch.io/drumpulous/drumpulous_linux.zip" # Right now, you must download manually from above website.
				"drumpulous.desktop"
				"drumpulous")
sha256sums=('4ce54efc8afc9142bc81146c3fb665747e169182a4658321fa91d58f7ef3dd9f'
            'b67db7cdef1e792d0c2c2d40554a873f1e45216c17a2b343629fd4c1f63540f5'
            '7b22e06ef52bc5783201c2cec9c0a21ac9e0c3e06bf0808c4344ae6605e9535e')

package() {
	cd "${srcdir}/drumpulous_linux"
 
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share/applications"
	install -dm755 "${pkgdir}/usr/share/icons"
	install -dm755 "${pkgdir}/opt/${pkgname}"
	cp -r drumpulous_Data "${pkgdir}/opt/${pkgname}/"
	[ "$CARCH" == "x86_64" ] && {
		install -D -m755 "${pkgname}.x86_64" "${pkgdir}/opt/${pkgname}/${pkgname}"
  }
	[ "$CARCH" == "i686" ] && {
		install -D -m755 "${pkgname}.x86" "${pkgdir}/opt/${pkgname}/${pkgname}"
  }
	install -D -m644 drumpulous_Data/Resources/UnityPlayer.png "${pkgdir}/usr/share/icons/${pkgname}.png"
	install -D -m644 ../drumpulous.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m755 ../drumpulous "${pkgdir}/usr/bin/drumpulous"
}

# vim: set ts=2 sw=2 ft=sh noet:
