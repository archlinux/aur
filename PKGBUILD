# Maintainer: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: jddolvin <jddolvin@atheist.com>
# Contributor: arriagga <ramon.arriaga@gmail.com>
# Contributor: dieghen89 <dieghen89@gmail.com>

pkgname=musique
pkgver=1.4
pkgrel=2
pkgdesc="Just another music player, only better"
arch=('i686' 'x86_64')
url="http://flavio.tordini.org/musique"
license=('GPL3')
depends=('qt4' 'desktop-file-utils' 'hicolor-icon-theme' 'phonon' 'taglib')
optdepends=('gstreamer0.10-good-plugins: for gstreamer backend - part 1'
        'gstreamer0.10-bad-plugins: for gstreamer backend - part 2'
        'gstreamer0.10-ugly-plugins: for gstreamer backend - part 3'
	'phonon-qt4-gstreamer: gstreamer backend'
	'phonon-mplayer-git: mplayer backend'
	'phonon-qt4-vlc: vlc backend')
replaces=("${pkgname}-git" 'minitunes' 'minitunes-git')
source=(http://flavio.tordini.org/files/musique/musique.tar.gz)
md5sums=(c8d7146913a91af4c5190084ac9f8182)

build() {
	cd ${srcdir}/${pkgname}
	qmake-qt4 PREFIX=/usr
}

package() {
	cd ${srcdir}/${pkgname}
	make INSTALL_ROOT=${pkgdir} install
}

