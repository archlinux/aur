# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duettools-bin
pkgver=1.2.3.0
pkgrel=2
pkgdesc="Optional tools (code examples)"
arch=('armv7h' 'aarch64')
url="https://github.com/chrishamm/DuetSoftwareFramework.git"
license=('GPL3')
provides=("duettools=${pkgver}")
conflicts=("duettools")
depends=("duetcontrolserver>=${pkgver}")
options=(!strip staticlibs)
source_armv7h=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duettools_${pkgver}_armhf.deb")
source_aarch64=("https://pkg.duet3d.com/dists/stable/armv7/binary-arm64/duettools_${pkgver}_arm64.deb")
md5sums_armv7h=('bc6a2cc8ca0e1ba8cfb53026ef335a5b')
md5sums_aarch64=('f2862c70ec06c6ef27a999ba9e086f9d')
sha1sums_armv7h=('4a6ed64ef46c9b6f851f3892107ee2af41b4daa7')
sha1sums_aarch64=('2290bee301f3313afb77c28f2d83af2f3353be4b')
sha256sums_armv7h=('fcfedd24bcb4665c86415d75aca5d005e6e2710036c6999882266650b2d66cb8')
sha256sums_aarch64=('bffae2e41deef719909912f15f07a9a554831b22b055aa84634d9fe1404ac5ed')
sha512sums_armv7h=('dd74704f87f622c7c38e36f94039dd7eaf2c8ca7bbb101b274303092e7a662c23ba4f9c8729e6e8c3092f76e1053b54cba5f85955c089c1119805adc9dad1ab0')
sha512sums_aarch64=('544b22169095b0e5df4f6d6a3eb28cab1f982f6fe6d6eb0fcc7d6267453d17065f0ad33c3cf8e7b1120769f4f5cfd31190f2e210272f1f188cee6bf4f8e390fb')

prepare() {
    tar -xf data.tar.xz
}

package() {

	# DuetControlServer, DuetWebServer, CodeConsole, CodeLogger
	install -dm 755 "${pkgdir}"/{opt/dsf/bin,opt/dsf/conf,usr/bin}
	install "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"

	ln -s "/opt/dsf/bin/CodeConsole" "${pkgdir}/usr/bin/"
	ln -s "/opt/dsf/bin/CodeLogger" "${pkgdir}/usr/bin/"
	ln -s "/opt/dsf/bin/CustomHttpEndpoint" "${pkgdir}/usr/bin/"
	ln -s "/opt/dsf/bin/ModelObserver" "${pkgdir}/usr/bin/"
}
