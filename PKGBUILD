# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

# This is the package build for the tools to build nban and the shuriken
# This was originally developed for Ninja OS, but has been back ported to Arch
# Linux.

# Lets be very clear in what "Boot'n'Nuke" means. It means it scrubs all data
# from all attached storage media upon boot. This is a security tool meant to
# end of life computers so they can be disposed of without the fear of data
# retrieval by an attacker. Unlike "Darik's Boot'n'Nuke", which is somewhat
# complex, Ninja Boot'n'Nuke is very simple with no options. It is based on
# Arch Linux, and follows the Arch Way. Simple, written in shell code, and
# re-uses existing Arch Linux features.

# Further more, this package can also create "shurikens", or a single use nban
# on a stick with extlinux bootloader. The tool allows for custom kernels, and
# in the future, isolinux and pxelinux, so that the user can make a custom
# shuriken for any hardware.(see shuriken_forge --help)

# This is very much a valid security tool, and its very well documented.

pkgname=ninjaos-bootandnuke
pkgver=1.5
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
sha256sums=('f645198e50fcdc7318786ba05ebad2ceea696f20ea027b9d95cb4d6410292b0e'
            'SKIP')
validpgpkeys=('D5E76841665A4408D73C2D8796FD6113A1F8331E')
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp -ra . "${pkgdir}"
}
