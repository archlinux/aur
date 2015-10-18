# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: demian <mikar Î±Ï„ gmx Î´Î¿Ï„ de>
pkgname=blockify-git
pkgver=v3.0.1.r0.g942a37b
pkgrel=1
pkgdesc="Mutes Spotify advertisements."
arch=("any")
url="https://github.com/mikar/blockify"
license=("MIT")
depends=("spotify" "pulseaudio" "alsa-utils" "wmctrl" "libwnck3" "pygtk"
         "gst-python" "python-dbus" "python-setuptools")
optdepends=("python-docopt")
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

    python setup.py install --root="${pkgdir}"
}
