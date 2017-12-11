# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=kiibohd-configurator-bin
_pkgname=kiibohd-configurator
pkgver=0.4.1
pkgrel=1
pkgdesc="Client Side Configuration & Flashing Software for Kiibohd compatible keyboards"
arch=('x86_64')
url="https://github.com/kiibohd/configurator"
license=('GPL3')
depends=('dfu-util')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("https://github.com/kiibohd/configurator/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb")
sha256sums=('39bf9c96551d4eb4db7818319b2455de8ef18fdb1d9ef91cb7d194d486d0299c')

package() {
    # Extract data
    tar -xf ${srcdir}/data.tar.xz -C ${pkgdir}

    # Update permissions to match the default system ones
    chmod 755 ${pkgdir}/opt/
    find ${pkgdir}/usr/ -type d -exec chmod 755 {} \;
}
