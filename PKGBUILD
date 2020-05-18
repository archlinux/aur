# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetcontrolserver-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="Control server application for Duet 3 series"
arch=('armv7h' 'aarch64')
url="https://github.com/chrishamm/DuetSoftwareFramework.git"
license=('GPL3')
provides=("duetcontrolserver=${pkgver}")
conflicts=("duetcontrolserver")
depends=("duetruntime>=${pkgver}" 'linux>=4.8')
options=(!strip staticlibs)
backup=('opt/dsf/conf/config.json')
source_armv7h=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetcontrolserver_${pkgver}_armhf.deb")
source_aarch64=("https://pkg.duet3d.com/dists/stable/armv7/binary-arm64/duetcontrolserver_${pkgver}_arm64.deb")
md5sums_armv7h=('fb4ca5bb1cd3d60e238ef5f45420444d')
md5sums_aarch64=('24195e62c28096aa19429dab3177eb6a')
sha1sums_armv7h=('5665cbea6eed29594d3e2449f6e289b7bd017ef2')
sha1sums_aarch64=('fa6bd4590c4fe1a9192dd3a76f1fb62c520c43d0')
sha256sums_armv7h=('aacc8afa558561c4e2ff02c76a1b1c976391cb3557f91da08b8f558b8fff95da')
sha256sums_aarch64=('69bee88353834d2f064fe2c3fe22c7265f427d31f569b4b79f617e033a4dfa4a')
sha512sums_armv7h=('f71d3d589a97e840da53dc6985aa55e8cf06d33a3144e415355544912714360dd85db3e392e31a55eded6654dbe610bcd0231ecd58739a990776d5e8092ce3d2')
sha512sums_aarch64=('0674a836c9215bbaaec39962bf63fed1d047908d95556e6bcef8742883bfac97cbc7a3270119a6a65477e6402ab43f9c7af71734f54da0602a06958f9edc118f')

prepare() {
    tar -xf data.tar.xz
}

package() {

	# DuetControlServer
	install -dm 755 "${pkgdir}"/{opt/dsf/bin,opt/dsf/conf,usr/bin,usr/lib/systemd/system}
	install "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"
	install "${srcdir}/usr/lib/systemd/system/"* "${pkgdir}/usr/lib/systemd/system"
	install "${srcdir}/opt/dsf/conf/"* "${pkgdir}/opt/dsf/conf"

	ln -s "/opt/dsf/bin/DuetControlServer" "${pkgdir}/usr/bin/"
}
