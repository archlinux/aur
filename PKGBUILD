# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: demian <mikar Î±Ï„ gmx Î´Î¿Ï„ de>
pkgname=blockify-git
pkgver=v2.0.1.beta.r0.gac01e4f
pkgrel=1
pkgdesc="Mutes Spotify advertisements."
arch=("any")
url="https://github.com/mikar/blockify"
license=("MIT")
depends=("pygtk" "python2-wnck" "python2-dbus" "alsa-utils"
         "python2-setuptools" "gstreamer0.10-python")
optdepends=("pulseaudio" "python2-docopt")
conflicts=("blockify")
provides=("blockify")
source=("$pkgname::git+https://github.com/mikar/blockify")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/[_-]/./g'
}

package() {
    cd "${srcdir}/${pkgname}"

    python2 setup.py install --root="${pkgdir}"
}
