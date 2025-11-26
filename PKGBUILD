#!/bin/bash
# Maintainer: Grigor Tonikyan <grigor.tonikyan@gmail.com>
export pkgname=antigravity-binary
export pkgver=1.11.9
export pkgrel=1
export pkgdesc="Google Antigravity IDE. Pre built package from official RPM"
export arch=('x86_64')
export url="https://antigravity.google/"
export license=('MIT')
export depends=('alsa-lib' 'at-spi2-core' 'glibc' 'gtk3' 'libdrm' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'xdg-utils')
export provides=('antigravity')
export conflicts=('antigravity')
export options=('!strip')
export source=("antigravity-${pkgver}.rpm::https://us-central1-yum.pkg.dev/projects/antigravity-auto-updater-dev/antigravity-rpm/Packages/b1bb95ae5f36ab983def9cb3d5eb3c282c5cea417bc3527ea60841bcaef41bd9-antigravity-1.11.9-1764119119.el8.x86_64.rpm")
export sha256sums=('SKIP')

srcdir="${srcdir:-.}"
pkgdir="${pkgdir:-.}"

package() {
	cd "${srcdir}" || exit
	for dir in opt usr var; do
		if [ -d "$dir" ]; then
			cp -r "$dir" "${pkgdir}/"
		fi
	done

	mkdir -p "${pkgdir}/usr/bin"
	ln -sf /opt/antigravity/bin/antigravity "${pkgdir}/usr/bin/antigravity"
}
sha256sums=('b1bb95ae5f36ab983def9cb3d5eb3c282c5cea417bc3527ea60841bcaef41bd9')
