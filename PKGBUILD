# Maintainer: gCurse <gcurse at web de>

pkgname=otr-verwaltung3p-dev
pkgver=1.0.0b8.post4
pkgrel=11
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
makedepends=('python-setuptools')
conflicts=('otr-verwaltung3p' 'otr-verwaltung3p-dev-git')
provides=('otr-verwaltung3p')

_pkgname='otr-verwaltung3p'

source=("https://github.com/EinApfelBaum/otr-verwaltung3p/archive/${pkgver}.tar.gz")
sha256sums=('8488a48c3a0ca3d4d5f793e8b6b410f8e6763ab086e5e06dd06a596378365040')
options=('!strip')

#prepare() {
    ## hotfix
    #patch "${srcdir}/${_pkgname}-${pkgver}/otrverwaltung3p/actions/decodeorcut.py" otrverwaltung3p_actions_decodeorcut.diff
#}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
