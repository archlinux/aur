# Maintainer: Hajos Attila <linux.alucard@gmail.com>

pkgname=gimp-stable-appimage
pkgver=2.10.36
pkgrel=6
pkgdesc="GNU Image Manipulation Program Stable Edition built from PPAs and JuNest (Arch Linux)"
url="https://github.com/ivan-hc/GIMP-appimage"
arch=(x86_64)
license=("GPL3")
conflicts=("gimp")
_appimage="GNU-Image-Manipulation-Program_${pkgver}-${pkgrel}-archimage3.4-x86_64.AppImage"
source=("${_appimage}::https://github.com/ivan-hc/GIMP-appimage/releases/download/continuous-stable/GNU-Image-Manipulation-Program_${pkgver}-${pkgrel}-archimage3.4-x86_64.AppImage"
        "gimp.desktop"
        "gimp.png")
sha512sums=('SKIP'
            'aae594d973acb338ce23f450693a0afb622451f3456d5c7fd58b6d17c534f3a76b108539de37906010f869adf0a38c8e1914d9e6824c3a49caf075ccc8a9ae06'
            '1a4deb31dff111fec6ebd3c0d9441aa265f0808d316a76b9703acebf4be1299337c17e01a7602e6ea99dceedbe9787ac0663bed5aa4347cb986ec60e4f38d7b0')
noextract=("${_appimage}")

package() {
	install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/gimp-stable/${_appimage}"
	install -Dm 644 "${srcdir}/gimp.desktop" "${pkgdir}/usr/share/applications/gimp.desktop"
	install -Dm 644 "${srcdir}/gimp.png" "${pkgdir}/usr/share/pixmaps/gimp-stable.png"
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/gimp-stable/${_appimage}" "${pkgdir}/usr/bin/gimp-stable"
}
