# Contributer: mzwing <mzwing@mzwing.eu.org>

pkgname='deepin-wine10-stable'
_pkgver=10.7deepin5
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Deepin wine10 stable"
arch=('x86_64')
url="http://www.deepin.org"
license=('Proprietary')
makedepends=('tar')
source=(
    "https://com-store-packages.uniontech.com/appstorev23/pool/appstore/d/deepin-wine10-stable/deepin-wine10-stable_${_pkgver}_amd64.deb"
)
noextract=(
    "deepin-wine10-stable_${_pkgver}_amd64.deb"
)
sha256sums=('9fbc92dfb2123aa6cff7caf43c412c67dc92dc170674bd87c11e2aa6e2256e4d')
DLAGENTS=("https::/usr/bin/curl -A 'apt' -fLC - --retry 3 --retry-delay 3 -o %o %u")
depends=(
    alsa-lib                   # libasound2 (>= 1.0.16)
    glibc                       # libc6 (>= 2.38)
    #libcapi                     # libcapi20-3
    dbus                        # libdbus-1-3 (>= 1.9.16)
    gcc-libs                    # libgcc-s1 (>= 3.0)
    #glib2                       # libglib2.0-0 (>= 2.37.3)
    libgphoto2                  # libgphoto2-6 (>= 2.5.10),  libgphoto2-port12 (>= 2.5.10)
    #gst-plugins-base            # libgstreamer-plugins-base1.0-0 (>= 1.0.0)
    #gstreamer                   # libgstreamer1.0-0 (>= 1.4.0)
    libpulse                    # libpulse0 (>= 0.99.1)
    sane                        # libsane (>= 1.0.27)
    systemd-libs                # libudev1 (>= 183)
    #libusb                      # libusb-1.0-0 (>= 2:1.0.21)
    wayland                     # libwayland-client0 (>= 1.20.0)
    libx11                      # libx11-6
    libxext                     # libxext6
    ocl-icd                     # ocl-icd-libopencl1 | libopencl1,  ocl-icd-libopencl1 (>= 1.0) | libopencl-1.2-1
    alsa-plugins                # libasound2-plugins
    ncurses                     # libncurses6 | libncurses5 | libncurses
)

optdepends=(
    libcap                      # libcap2-bin
    cups                        # libcups2
    nss                         # libnss-myhostname
    fontconfig                  # libfontconfig1
    freetype2                    # libfreetype6
    mesa                        # libglu1-mesa | libglu1
    gnutls                      # libgnutls30 | libgnutls28 | libgnutls26
    libjpeg-turbo               # libjpeg62-turbo | libjpeg8
    krb5                        # libgssapi-krb5-2, libkrb5-3
    unixodbc                    # libodbc1
    mesa                        # libosmesa6
    sdl2                        # libsdl2-2.0-0
    v4l-utils                   # libv4l-0
    libxcomposite               # libxcomposite1
    libxcursor                  # libxcursor1
    libxfixes                   # libxfixes3
    libxi                       # libxi6
    libxinerama                 # libxinerama1
    libxrandr                   # libxrandr2
    libxrender                  # libxrender1
    libxxf86vm                  # libxxf86vm1
)

package() {

    mkdir -p "deepin-wine10-stable_${_pkgver}"
    ar -x "deepin-wine10-stable_${_pkgver}_amd64.deb" data.tar.xz --output "deepin-wine10-stable_${_pkgver}"
    tar -xf "deepin-wine10-stable_${_pkgver}/data.tar.xz" --directory="${pkgdir}"
}
