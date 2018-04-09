# Maintainer: gCurse <gcurse at web de>

pkgname='otr-verwaltung2p-git'
pkgver='0.9.7'
pkgrel='1'
pkgdesc='Manage your onlinetvrecorder.com files: cut, preview cuts, rate cutlists etc.'
arch=('any')
url='https://www.otrforum.com/showthread.php?67612-OTR-Verwaltung-durch-Patches-erweiterte-OTR-Verwaltung-Betatest'
license=('GPL3')
depends=('pygtk' 'python2-xdg' 'python2-dbus' 'python2-simplejson' 'libtorrent-rasterbar'
         'gstreamer0.10' 'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins'
         'gstreamer0.10-ugly-plugins' 'gstreamer0.10-gnonlin' 'gstreamer0.10-ffmpeg'
         'gstreamer0.10-python' 'mplayer' 'aria2' 'wget')
optdepends=('avidemux-cli:  If you do NOT want to use Smartmkvmerge for divx (not recommended)'
            'avidemux-qt:   If you do NOT want to use the internal Cutinterface (not recommended)'
            'wine:          If you want to use virtualdub (only needed for old recordings (2011 and earlier))'
            'mediainfo-gui: For mediainfo-gui')
makedepends=('python2-distutils-extra')

source=("git+https://github.com/monarc99/otr-verwaltung.git#branch=master")
sha256sums=('SKIP')
_gitname='otr-verwaltung'

pkgver() {
    cd ${_gitname}
    cat data/VERSION
}

package() {
    cd ${_gitname}
    python2 setup.py install --root=${pkgdir} --optimize=1
}
