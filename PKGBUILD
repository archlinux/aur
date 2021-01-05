# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetsoftwareframework-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Meta package for the full Duet software framework"
arch=('any')
url="https://github.com/Duet3D/DuetSoftwareFramework"
license=('GPL3')
provides=("duetsoftwareframework=${pkgver}")
conflicts=("duetsoftwareframework")
optdepends=(
	"duetruntime-bin>=${pkgver}"
	"duetcontrolserver-bin>=${pkgver}"
	"duetsd-bin>=1.1.0"
	"duettools-bin>=${pkgver}"
	"duetwebcontrol-bin>=${pkgver}"
	"duetwebserver-bin>=${pkgver}"
	"reprapfirmware-bin>=${pkgver}"
)
install="${pkgname}.install"
source=("https://pkg.duet3d.com/dists/unstable/armv7/binary-armhf/duetsoftwareframework_${pkgver//_/-}_armhf.deb")
md5sums=('5bc57bddcef36bf0c2c439c49e42e3ea')
sha1sums=('cf987fc6e6b893f3f5a44e110e00b3d7819a6743')
sha256sums=('d9b93f5612b84c083b5eb5687549baf440606b8ebb8eb912068df9e0d57f3456')
sha512sums=('b5f2efb2fc9bb45aa32ad4d0559a9727e777190d59cadc60e2c29ba64a03a03728880697fbb4bdfa3cbb2b0a1c3184536460104056a34f17c5ee4af0e399131d')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -Dm 644 "${srcdir}/usr/lib/sysusers.d/duetsoftwareframework.conf" "${pkgdir}/usr/lib/sysusers.d/duetsoftwareframework.conf"
}
