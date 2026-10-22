# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>
pkgname=rossat-swarm-bin
_pkgname=rossat-swarm
pkgver=1.0.1
pkgrel=1
pkgdesc="Open re-implementation of ROCCAT Swarm (GUI, CLI, library) for the Kone AIMO Remastered"
arch=('x86_64')
url="https://github.com/TheElevatedOne/rossat-swarm"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'hidapi' 'gtk3' 'glib2' 'cairo' 'gdk-pixbuf2' 'libayatana-appindicator')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
install="${_pkgname}.install"
source=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64.tar.gz")
# Built by .github/workflows/release.yml; run `updpkgsums` once the 1.0.1 release exists.
sha256sums=('d8e73c52cbf27ff3ae138a90e5aab5e86b2e3e8a31885f7dd708d60409f84fc9')

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/"
    install -Dm644 "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
