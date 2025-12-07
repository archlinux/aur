#!/bin/bash
# Maintainer: Grigor Tonikyan <grigor.tonikyan@gmail.com>
export pkgname=antigravity-binary
export pkgver=1.11.14
export pkgrel=1
export pkgdesc="Google Antigravity IDE. Pre built package from official RPM"
export arch=('x86_64')
export url="https://antigravity.google/"
export license=('MIT')
export depends=('alsa-lib' 'at-spi2-core' 'glibc' 'gtk3' 'libdrm' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'xdg-utils')
export provides=('antigravity')
export conflicts=('antigravity')
export options=('!strip')
export source=("antigravity-${pkgver}.rpm::https://us-central1-yum.pkg.dev/projects/antigravity-auto-updater-dev/antigravity-rpm/Packages/12ddf0bf19f30ecc9d63fc839304eb8d5bf277000aaae8d3dfbcf573775167c8-antigravity-1.11.14-1764916514.el8.x86_64.rpm")
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
sha256sums=('12ddf0bf19f30ecc9d63fc839304eb8d5bf277000aaae8d3dfbcf573775167c8')
