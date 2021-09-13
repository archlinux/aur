# Contributor: shmilee <shmilee.zju@gmail.com>
# Contributor: MJsaka <qiuxuenan@gmail.com>

pkgname=kwplayer
pkgver=3.5.2
pkgrel=2
pkgdesc='An elegant music player which can get songs from kuwo.cn'
arch=('any')
license=('GPL3')
url="https://github.com/LiuLang/kwplayer"
depends=('python-cairo' 'python-html2text' 'python-gobject' 'gtk3' 'python-dbus' 'dbus-glib' 'python-ply'
         'gst-plugins-base' 'gst-plugins-ugly' 'gst-plugins-good' 'gstreamer' 'gst-libav'
         'gnome-icon-theme-symbolic')
optdepends=('python-plyvel: use leveldb for cache data')
source=("https://pypi.python.org/packages/source/k/kwplayer/${pkgname}-${pkgver}.tar.gz")
md5sums=('3b446246b7a690e9e91fd5380053d11e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}