# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetruntime-bin
pkgver=1.2.3.0
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
md5sums=('df3bd25df823db091f25a58a12a4f593')
sha1sums=('d22928e40d48fb7e79c4d5bc3650ef8263a6a6dd')
sha256sums=('538c2757f23db55cc53a6769882297bcf4cfc1f44c76a975e8f220b9a1c45fcd')
sha512sums=('70dd3dd5824e5375525132bdddb05f6f2719eb5d2b7ad320b82e9eb093c9f20e2c5a39f77dde2c26d68086b518f1dc83ea2df9caceb2039264fa2b5a4d037091')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}"/opt/dsf/bin
	install -m 644 "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"
}
