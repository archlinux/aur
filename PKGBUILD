# Maintainer: Jonathon Fernyhough <jonathon+at m2x.dev>
# Contributor: Yarema aka Knedlyk <yupadmin@gmail.com>
# Contributor: zoe <chp321 [at] gmail [dot] com>

pkgname=radiotray
pkgver=0.7.3
pkgrel=15
pkgdesc="An online radio streaming player that runs on a Linux system tray."
arch=(any)
url="https://radiotray.wordpress.com/"
license=(GPL)
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-good'
         'dbus-python' 'python-gobject' 'python-lxml' 'python-notify2' 'python-xdg')
optdepends=('gst-plugins-bad: extra codec support'
            'gst-plugins-ugly: extra codec support'
            'gst-libav: nonfree media decoding'
            'libappindicator-gtk3: indicator applet support')
#source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/radiotray/files/releases/${pkgname}-${pkgver}.tar.gz/download/"
#        "encoding.patch"
#        "02_compatibility_glib-2.41.patch"
#        "03_upstream_repo.patch"
#        "04_gtk3_issues.patch"
#        "reduce-logging.patch")
source=(git+https://github.com/lubosz/radiotray.git#commit=0303ad6017a9a81caa71d046ef270ba6ebefed39)

b2sums=('SKIP')

#prepare() {
#    cd $pkgname-$pkgver
#    patch -Np1 < "${srcdir}/encoding.patch"
#    patch -Np1 < "${srcdir}/02_compatibility_glib-2.41.patch"
#    patch -Np1 < "${srcdir}/03_upstream_repo.patch"
#    patch -Np1 < "${srcdir}/04_gtk3_issues.patch"
#    patch -Np1 < "${srcdir}/reduce-logging.patch"
#}

package() {
    cd $pkgname
    python setup.py install --root="$pkgdir" --optimize=1
}
