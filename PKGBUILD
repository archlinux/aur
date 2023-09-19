# Originally: Ultraleap <info@ultraleap.com>
# Maintainer: Sam Bilbow <samuel.bilbow@icloud.com>
pkgname=openxr-layer-ultraleap
pkgver=1.6.0
commit=243d3f37
ci=1034443
pkgrel=1
epoch=
pkgdesc="Ultraleap OpenXR Hand Tracking API Layer. Enables Ultraleap hand-tracking on an existing OpenXR runtime"
arch=('x86_64')
url=""
license=('PROPRIETARY')
groups=('ultraleap-hand-tracking')
depends=('ultraleap-hand-tracking-service')
makedepends=()
checkdepends=()
optdepends=()
provides=('openxr-layer-ultraleap')
conflicts=()
replaces=()
backup=()
options=()
install='openxr-layer-ultraleap.install'
changelog=
source=("https://repo.ultraleap.com/apt/pool/main/o/${pkgname}/${pkgname}_${pkgver}%2b${commit}.CI${ci}_amd64.deb"
		'openxr-layer-ultraleap.conf')
noextract=()
md5sums=('6c6ac02fb4d7541e69d56019658f306a'
		 '378b1c86a576dc5ad4a6498e95d6925d')
validpgpkeys=()

prepare() {
    tar xzf "data.tar.gz"
}

package() {
	install -D -m644 "${srcdir}/usr/lib/${pkgname}/libUltraleapHandTracking.so.1.6.0.0" "${pkgdir}/usr/lib/${pkgname}/libUltraleapHandTracking.so.1.6.0.0"

	install -D -m644 "${srcdir}/usr/share/openxr/1/api_layers/implicit.d/XrApiLayer_Ultraleap.json" "${pkgdir}/usr/share/openxr/1/api_layers/implicit.d/XrApiLayer_Ultraleap.json"

	install -D -m644 "${srcdir}/openxr-layer-ultraleap.conf" "${pkgdir}/etc/ld.so.conf.d/openxr-layer-ultraleap.conf"

	# doc
	install -D -m644 "${srcdir}/usr/share/doc/openxr-layer-ultraleap/copyright" "${pkgdir}/usr/share/doc/openxr-layer-ultraleap/copyright"
	install -D -m644 "${srcdir}/usr/share/doc/openxr-layer-ultraleap/LICENSE.md" "${pkgdir}/usr/share/doc/openxr-layer-ultraleap/LICENSE.md"
	install -D -m644 "${srcdir}/usr/share/doc/openxr-layer-ultraleap/NEWS.gz" "${pkgdir}/usr/share/doc/openxr-layer-ultraleap/NEWS.gz"
	install -D -m644 "${srcdir}/usr/share/doc/openxr-layer-ultraleap/NOTICES.md" "${pkgdir}/usr/share/doc/openxr-layer-ultraleap/NOTICES.md"
	install -D -m644 "${srcdir}/usr/share/doc/openxr-layer-ultraleap/README.md" "${pkgdir}/usr/share/doc/openxr-layer-ultraleap/README.md"
}
