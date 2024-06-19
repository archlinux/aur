# Maintainer: Lionel Miller <delonorm at gmail dot com>
# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=kontur-diag-plugin
pkgver=3.1.2.373
pkgrel=1
pkgdesc="Diag.Plugin is an extension for web browsers that allows users to install cryptographic programs for SKB Kontur services."
arch=('x86_64')
license=('proprietary')
depends=('gtk3')
makedepends=('findutils' 'grep' 'sed' 'coreutils')
url='https://help.kontur.ru/'

_patch='001814'
source=("https://api.kontur.ru/drive/v1/public/diag/files/diag.plugin-${pkgver}-${pkgrel}.${arch}.${_patch}.rpm")
sha256sums=('ed1ae3c20ae8dd8c1c52fe86b1d8dc132f0918fd061debe87dff057b26fdd849')

package() {
	find "${srcdir}" -type f | grep -v lib64 | sed -e "s#${srcdir}/##g" | xargs -I{} install -Dvm644 "${srcdir}/{}" "${pkgdir}/{}"
	find "${pkgdir}/opt" -type f | xargs chmod 755
}

