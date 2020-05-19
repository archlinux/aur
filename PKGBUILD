# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetcontrolserver-bin
pkgver=3.1.1
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
md5sums_armv7h=('6a29a48677ef333dc1bdc72410001ce4')
md5sums_aarch64=('f319c4e79d75c275e5805efc54c83053')
sha1sums_armv7h=('7739bbb973afa9719a0706be2c9b25511df58f0c')
sha1sums_aarch64=('fea14553bf58f0b34b9ab64f0e8fb06808e5e809')
sha256sums_armv7h=('49859e49b52b9bbc9d0951ecc759a46ea22f19f25e1f255f71f2dfcd6ca51d7d')
sha256sums_aarch64=('665b3e94ec271084b371cfd60443ec6ae4392b4814e3c4307cf172b0d2c8e9a6')
sha512sums_armv7h=('10ad236feb9150cc06f40730b541c5ad01cb1f49d3873886a5fe0c223216f3e2ac036d4429a16c8785b7a374967876bff52606011fee2ad20913f8e31e85d5d0')
sha512sums_aarch64=('2dac806888e273ec769b1613522d20aa36e1efb71143c908da06aa7c9ecc4e0b231e6acadbc449be490bbf9464856955a08fdf90121eb8ef19c78b77f80c9adb')

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
