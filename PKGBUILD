# Maintainer: gCurse <gcurse at web de>

pkgname=otr-verwaltung3p-dev-git
pkgver=0.0.0
pkgrel=2
pkgdesc='Manage your onlinetvrecorder.com files: cut, preview cuts, rate cutlists etc.'
arch=('any')
url='https://github.com/EinApfelBaum/otr-verwaltung3p'
license=('GPL3')
depends=('gtk3' 'python' 'python-gobject' 'gst-python' 'python-xdg' 'python-dbus' 'python-cairo'
         'python-requests' 'python-keyring' 'gst-plugins-base' 'gst-plugins-good'
         'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav' 'mpv' 'ffmpeg' 'ffms2' 'mediainfo'
         'mkvtoolnix-cli')
optdepends=('gnome-keyring: For password storing in keyring'
            'kwallet: For password storing in wallet'
            'mediainfo-gui: For plugin Mediainfo'
            'otr-verwaltung3p-vdub: For cutting old OTR files')
makedepends=('python-distutils-extra')
conflicts=('otr-verwaltung3p' 'otr-verwaltung3p-dev')
provides=('otr-verwaltung3p')
source=("git+https://github.com/EinApfelBaum/otr-verwaltung3p.git#branch=development")
sha256sums=('SKIP')
options=('!strip')

_gitname='otr-verwaltung3p'

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_gitname}"
    python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
