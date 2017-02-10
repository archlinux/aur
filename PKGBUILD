# Maintainer: Daniel Holman <coderdan657@gmail.com>
pkgname=refind-black-git
pkgver=r2.3a2a9d9
pkgrel=1
pkgdesc="Minimalistic, flat, black and white theme for rEFInd."
arch=('any')
url="https://github.com/anthon38/refind-black"
license=('none')
depends=('refind-efi')
makedepends=('git')
source=('git+https://github.com/anthon38/refind-black.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	REFIND_HOME="${pkgdir}/boot/EFI/refind"

        mkdir -p "${REFIND_HOME}"
        cp -r "${srcdir}/${pkgname%-git}" "${REFIND_HOME}"
        chmod -R 644 "${REFIND_HOME}/${pkgname%-git}"

        echo 'Remember to add "include refind-black/theme.conf" to your refind.conf file'
}
