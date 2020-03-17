# Maintainer: gCurse <gcurse at web de>

pkgname=otr-verwaltung3p-dev
pkgver=1.0.0beta002
pkgrel=3
pkgdesc='Manage your onlinetvrecorder.com files: cut, preview cuts, rate cutlists etc.'
arch=('any')
url='https://github.com/EinApfelBaum/otr-verwaltung3p'
license=('GPL3')
depends=('gtk3' 'python' 'python-gobject' 'gst-python' 'python-xdg' 'python-dbus' 'python-cairo'
         'python-requests' 'python-keyring' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugin-gtk'
         'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav' 'mpv' 'ffmpeg' 'ffms2' 'mediainfo'
         'mkvtoolnix-cli')
optdepends=('gnome-keyring: To store the password in keyring'
            'kwallet: To store the password in wallet'
            'mediainfo-gui: For plugin Mediainfo'
            'otr-verwaltung3p-vdub: For cutting old OTR files')
makedepends=('python-distutils-extra')
conflicts=('otr-verwaltung3p' 'otr-verwaltung3p-dev-git')
provides=('otr-verwaltung3p')

_pkgname='otr-verwaltung3p'
_pkgver=1.0.0-beta002

source=("https://github.com/EinApfelBaum/otr-verwaltung3p/archive/${_pkgver}.tar.gz")
sha256sums=('11c28866d445fda7ac255e3e850d9d63c44991fd42abf8749b2fd108fc13d3d4')
options=('!strip')


package() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
