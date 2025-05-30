# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=nutty
_binname=com.github.babluboy.${_basename}
pkgname=${_basename}-bin
pkgver=1.2.0
pkgrel=2
pkgdesc="A network utility for linux. Monitor the devices on your network and check bandwidth and speed details."
arch=('x86_64')
url="https://github.com/babluboy/nutty"
license=('GPL3')
conflicts=("${_basename}" "${_basename}-git")
provides=("${_basename}")
makedepends=('tar')
depends=('gtk3' 'granite' 'sqlite' 'libxml2' 'libnotify' 'libgee' 'net-tools' 'nethogs' 'nmap' 'traceroute' 'vnstat' 'curl' 'wireless_tools' 'iproute2' 'pciutils')
source=("https://github.com/babluboy/nutty/releases/download/${pkgver}/com.github.babluboy.${_basename}_${pkgver}_amd64.deb")
sha256sums=('29016eb071dcd4df01cdaeec61c59c396fde465584b06e80d4531389ceee784a')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.zst"
    ln -rsf "${pkgdir}/usr/bin/${_binname}" "${pkgdir}/usr/bin/${_basename}"
}
