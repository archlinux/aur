# Maintainer: Lionel Miller <delonorm at gmail dot com>
# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=kontur-diag-plugin
pkgver=3.1.0.210
pkgrel=1
pkgdesc="Diag.Plugin is an extension for web browsers that allows users to install cryptographic programs for SKB Kontur services."
arch=('x86_64')
license=('proprietary')
depends=(
	'gtk3'
)
makedepends=('findutils' 'grep' 'sed' 'coreutils')
url="https://help.kontur.ru/"
source=("https://api.kontur.ru/drive/v1/public/diag/files/diag.plugin-${pkgver}-1.x86_64.000865.rpm")
sha256sums=('bd5070f3a3ee21456fe378480f353f4457089f88e69efc47ed48de9100052ebf')

package() {
	find "${srcdir}" -type f | grep -v lib64 | sed -e "s#${srcdir}/##g" | xargs -I{} install -Dvm644 "${srcdir}/{}" "${pkgdir}/{}"
	find "${pkgdir}/opt" -type f | xargs chmod 755
}

