# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetruntime-bin
pkgver=1.2.3.0
pkgrel=2
pkgdesc=".NET Core runtime libraries for the Duet software framework"
arch=('armv7h' 'aarch64')
url="https://github.com/chrishamm/DuetSoftwareFramework.git"
license=('GPL3')
provides=("duetruntime=${pkgver}")
conflicts=('duetruntime')
depends=('curl' 'gettext' 'libunwind')
options=(!strip staticlibs)
source_armv7h=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetruntime_${pkgver}_armhf.deb")
source_aarch64=("https://pkg.duet3d.com/dists/stable/armv7/binary-arm64/duetruntime_${pkgver}_arm64.deb")
md5sums_armv7h=('df3bd25df823db091f25a58a12a4f593')
md5sums_aarch64=('5bf9e12162afe32b813bb8d17b57ca23')
sha1sums_armv7h=('d22928e40d48fb7e79c4d5bc3650ef8263a6a6dd')
sha1sums_aarch64=('4b1797d23bae102e0c4c179b2ec1141930b22ba0')
sha256sums_armv7h=('538c2757f23db55cc53a6769882297bcf4cfc1f44c76a975e8f220b9a1c45fcd')
sha256sums_aarch64=('68df96b107323b0752adf1601e61a6f250844cb52f1d954cce0906419f62acb2')
sha512sums_armv7h=('70dd3dd5824e5375525132bdddb05f6f2719eb5d2b7ad320b82e9eb093c9f20e2c5a39f77dde2c26d68086b518f1dc83ea2df9caceb2039264fa2b5a4d037091')
sha512sums_aarch64=('54dfb61d03c783510e11d38cfb0cb55977cd9b51e50fc3216bf815f0ff267915f460be31bbe0730e3790f53a67b7fdd4fbc5998345f7aa660a3c58f9f6a7234a')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}"/opt/dsf/bin
	install -m 644 "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"
}
