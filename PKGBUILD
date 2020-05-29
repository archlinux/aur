# Maintainer: gCurse <gcurse at web de>

pkgname=otr-verwaltung3p-dev
pkgver=1.0.0b5
pkgrel=5
pkgdesc='Manage your onlinetvrecorder.com files: cut, preview cuts, rate cutlists etc.'
arch=('any')
url='https://github.com/EinApfelBaum/otr-verwaltung3p'
license=('GPL3')
depends=('gtk3' 'python' 'python-gobject' 'gst-python' 'python-appdirs' 'python-psutil' 'python-cairo'
         'python-requests' 'python-keyring' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugin-gtk'
         'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav' 'mpv' 'ffmpeg' 'ffms2' 'mediainfo'
         'mkvtoolnix-cli' 'x264')
optdepends=('gnome-keyring: To store the password in keyring'
            'kwallet: To store the password in wallet'
            'mediainfo-gui: For plugin Mediainfo')
makedepends=('python-distutils-extra')
conflicts=('otr-verwaltung3p' 'otr-verwaltung3p-dev-git')
provides=('otr-verwaltung3p')

_pkgname='otr-verwaltung3p'

source=("https://github.com/EinApfelBaum/otr-verwaltung3p/archive/${pkgver}.tar.gz")
sha256sums=('a868d2c11696d03d58f3d6846e6c49e17989f29be316d6fd797570d4380e4f15')
options=('!strip')


package() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
