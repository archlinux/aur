# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetruntime-bin
pkgver=1.2.2.1
pkgrel=1
pkgdesc=".NET Core runtime libraries for the Duet software framework"
arch=('armv7h')
url="https://github.com/chrishamm/DuetSoftwareFramework.git"
license=('GPL3')
provides=("duetruntime=${pkgver}")
conflicts=('duetruntime')
depends=('curl' 'gettext' 'libunwind')
options=(!strip staticlibs)
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetruntime_${pkgver}_armhf.deb")
sha512sums=('6749b991253e8f9a6f7ec688a276a39f58cabb848ee9d0226c78e650bee62577f6601ebc415238ec1c92314eee42e373f04032fe2ef6f721a84818c0755061a3')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}"/opt/dsf/bin
	install -m 644 "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"
}
