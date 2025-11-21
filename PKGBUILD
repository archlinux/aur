#!/bin/bash
# Maintainer: Grigor Tonikyan <grigor.tonikyan@gmail.com>
export pkgname=antigravity-binary
export pkgver=1.11.5
export pkgrel=1
export pkgdesc="Google Antigravity IDE. Pre built package from official RPM"
export arch=('x86_64')
export url="https://github.com/GrigorTonikyan/aur-antigravity"
export license=('MIT')
export depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils')
export provides=('antigravity')
export conflicts=('antigravity')
export source=("antigravity-${pkgver}.rpm::https://us-central1-yum.pkg.dev/projects/antigravity-auto-updater-dev/antigravity-rpm/Packages/2a06354d15ee9c6465b25b79a9f9971b71b42fcf5e3600585559b8c678a7548c-antigravity-1.11.5-1763625986.el8.x86_64.rpm")
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
}
sha256sums=('2a06354d15ee9c6465b25b79a9f9971b71b42fcf5e3600585559b8c678a7548c')
