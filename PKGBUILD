# Maintainer:  Edgar Vincent <e-v@posteo.net>
_pkgname=waked
pkgname=${_pkgname}-bin
pkgrel=1
pkgver=0.1.1
# See http://julianfairfax.gitlab.io/package-repo/waked/version.txt
pkgdesc="Daemon to let other applications wake up the system. Binary version."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/seath1/waked"
license=('GPL2')
depends=('sdbus-cpp')
provides=("$_pkgname")
conflicts=("${_pkgname}-git")
_commit=05729fb50d6d032f7d269b5fd3068f8bd17b31fe
source=("git+https://gitlab.com/seath1/waked.git#commit=${_commit}")
source_x86_64=("${pkgname}::https://julianfairfax.gitlab.io/package-repo/waked/amd64/waked"
               "${pkgname}.asc::https://julianfairfax.gitlab.io/package-repo/waked/amd64/waked.asc")
source_aarch64=("${pkgname}::https://julianfairfax.gitlab.io/package-repo/waked/arm64/waked"
                "${pkgname}.asc::https://julianfairfax.gitlab.io/package-repo/waked/arm64/waked.asc")
sha256sums=('SKIP')
sha256sums_x86_64=('1638e7419e0bb9679dc421958bf7735e93f4056d767c84abcf78f0ddbfcfb908'
                  'SKIP')
sha256sums_aarch64=('4c28cd04ace04ace5319daebec840a945a98fdc54c6493c33716b46928b89dda'
                   'SKIP')
validpgpkeys=('C123CB2B21B9F68C80A03AE005B2039A85E7C70A')

package() {
  install -Dm0755 -T "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" "${srcdir}/${_pkgname}/${_pkgname}.service"
  install -Dm644 -t "${pkgdir}/etc/dbus-1/system.d/" "${srcdir}/${_pkgname}/de.seath.Waked.conf"
}

# vim:set ts=2 sw=2 et:
