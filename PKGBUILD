# Maintainer: GI_Jack <GI_Jack@hackermail.com>

# Ninja Boot'n'Nuke.
#
# This is the package build for the tools to build nban and the shuriken
# This was originally developed for Ninja OS, but has been back ported to Arch
# Linux.

# This is a security tool meant to end of life computers so they can be disposed
# of without the fear of data retrieval by an attacker. Unlike "Darik's
# Boot'n'Nuke", which is somewhat complex, Ninja Boot'n'Nuke is very simple
# with no options.

# Ninja Boot'n'Nuke, also refered to as NBAN is built around Arch's initcpio
# system, and uses a dash script inside of an initcpio image, built using Arch's
# mkinitcpio tool.

# This package can also create "shurikens", or a single use nban
# on a stick with extlinux bootloader. The tool allows for custom kernels, and
# in the future, isolinux and pxelinux, so that the user can make a custom
# shuriken for any hardware.(see shuriken_forge --help)

pkgname=ninjaos-bootandnuke
pkgver=2.0
pkgrel=1
pkgdesc="Ninja Boot'n'Nuke. Boot'n'Nuke implemented as an initcpio image."
url="http://ninjaos.org/projects.html#bootandnuke"
arch=('any')
license=('GPL3')
groups=('ninjaos')
depends=('mkinitcpio' 'syslinux' 'parted' 'dosfstools')
install="${pkgname}.install"
replaces=("mkinitcpio-nban")
conflicts=("mkinitcpio-nban")
provides=("mkinitcpio-nban")
source=("http://ninjaos.org/downloads/projects/${pkgname}-${pkgver}.tar.gz"
        "http://ninjaos.org/downloads/projects/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('210f02867da2abc510c3b6605885493abed7cefd4e985da730d971ea2db6b794'
            'SKIP')
validpgpkeys=('C65B1F383A46C38A3D3CFDF9C61EC681A148AF51')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp -ra . "${pkgdir}"
}
