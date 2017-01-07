# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>
# Contributor: Bastien Traverse <firstname at lastname dot email>
# Contributor: Samantha Baldwin <fuhsaz+git@cryptic.li>
# Contributor: Caleb Reach <jtxx000@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

pkgname=whipper
pkgver=0.4.1
pkgrel=1
pkgdesc="A Unix CD ripper aiming for accuracy over speed -- forked from morituri"
arch=('any')
url="https://github.com/JoeLametta/whipper"
license=('GPL3')
depends=(
    'accuraterip-checksum'          # for accuraterip-checksum calculation
    'cddb-py'                       # for showing but not using disc info if not in MusicBrainz (issue #28)
    'cdparanoia'                    # for the actual ripping
    'cdrdao'                        # for session, TOC, pregap, and ISRC extraction
    'gstreamer0.10-base'            # for encoding
    'gstreamer0.10-base-plugins'    # for appsink
    'gstreamer0.10-good-plugins'    # for wav encoding
    'gstreamer0.10-python'          # for encoding
    'libsndfile'                    # for reading wav files (pulls in flac, also required for reading flac files)
    'python2-musicbrainzngs'        # for metadata lookup
    'python2-pycdio'                # for storing drive identification in config file
    'python2-setuptools'            # for plugin support
    'sox'                           # for track peak detection'
    )
makedepends=(
    'python2-gobject2'
    )
conflicts=('morituri')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('dfd9d3c9fedc2ba861f378cfb751756cdd2ef7372b8783ca29795ed9e83005cfec9693d974c3fd2b21c6d1a0519974c025efe4eb9900e3dc50c42602792b14a5')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}"/ --optimize=1
}
