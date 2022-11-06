# $Id$
# Maintainer:  Paul Moffat        <aur@paulmoffat.net>
# Contributor: Silvio Fricke      <silvio.fricke@gmail.com>
# Contributor: Florian Pritz      <bluewind@xinu.at>
# Contributor: Kevin Piche        <kevin@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

_pkgname=zim
pkgname=${_pkgname}-git
pkgver=0.75.1
pkgrel=1
pkgdesc="A WYSIWYG text editor that aims at bringing the concept of a wiki to the desktop. Git Version"
arch=(any)
license=('GPL' 'PerlArtistic')
url="http://zim-wiki.org/"
depends=('gtk3' 'libaccounts-glib' 'libblockdev' 'libibus' 'libgexiv2' 'python' 'python-babel' 'python-gobject' 'python-pillow' 'python-pyxdg' 'xapp')
conflicts=('zim')
replaces=('zim')
optdepends=('xdg-utils: recommended on linux'
            'bzr: Version Control plugin'
            'ditaa: Insert Ditaa plugin'
            'git: Version Control plugin'
            'gnuplot: Insert Gnuplot plugin'
            'graphviz: Insert Diagram & Link Map plugins'
            'gtkspell3: Spell Checker plugin'
            'gtksourceview3: Source View plugin'
            'hicolor-icon-theme: hicolor theme hierarchy'
            'lilypond: Insert Score plugin'
            'mercurial: Version Control plugin'
            'pygtksourceview2: Source View plugin'
            'python-gtkspell: Spell Checker plugin'
            'r: Insert GNU R Plot plugin'
            'scrot: Insert Screenshot plugin'
            'texlive-bin: Insert Equation plugin'
            'xdot: Link Map plugin'
            'zeitgeist: Log events with Zeitgeist plugin'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zim-desktop-wiki/zim-desktop-wiki/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('027fee89db2871de8ce09457ed81cdbd')

package() {
    cd ${srcdir}/${_pkgname}-desktop-wiki-${pkgver}
    python setup.py install --root=${pkgdir} --optimize=1
}
