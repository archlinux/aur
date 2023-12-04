pkgver=20230323.gitbcdcfbcf
pkgname=linux-firmware-x13s-bin
pkgdesc='Prebuilt Linux kernel and modules for Lenovo ThinkPad X13s from Ubuntu Concept (unsigned)'
pkgrel=202311171005
arch=(any)
url='https://launchpad.net/~ubuntu-concept/+archive/ubuntu/x13s'
license=('GPL2' 'GPL3' 'custom')
_ubuntu_version=23.04
source=(
    "${url}/+files/linux-firmware_${pkgver}-0ubuntu1.9+x13s+${pkgrel}~ubuntu${_ubuntu_version}.1_all.deb"
)
sha256sums=(
    'ee66d3c2b5b3cb289eeb015361183b082120f50e44faba5f5ee4fcd9892f2333'
)
provides=(
    linux-firmware
    linux-firmware-x13s
)
noextract=(${source[@]##*/})

package() {
    bsdtar xfO ${source[0]##*/} data.tar* | bsdtar xf -
    mv lib usr
    mv usr/share/doc/linux-{firmware,firmware-x13s-bin}
	mv usr "$pkgdir"
}
