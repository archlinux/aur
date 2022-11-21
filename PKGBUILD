# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Andreas Schnaiter <rc.poison@gmail.com>

pkgname=smtube
pkgver=21.10.0
pkgrel=4
pkgdesc="An application that allows to browse, search and play YouTube videos"
arch=(x86_64)
url="https://www.smtube.org/"
license=(GPL2)
depends=(gcc-libs glibc hicolor-icon-theme qt5-webkit)
makedepends=(qt5-tools)
optdepends=('mplayer: play videos with MPlayer'
            'smplayer: play videos with SMPlayer'
            'gnome-mplayer: play videos with GNOME MPlayer'
            'dragon: play videos with Dragon Player'
            'totem: play videos with Totem'
            'vlc: play videos with VLC'
            'mpv: play videos with MPV'
            'youtube-dl: download videos')
source=("https://downloads.sourceforge.net/project/${pkgname}/SMTube/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('7535dc2d1a66647adc7440cc0922f7d4bd6e91ed75bc68651dd38c33506911d9a6f062b90d787f58f78dc1be9b3be3590e75e89d5a1807b26f824d24c1ab5b59')
b2sums=('87ea3d94e15f88f1d1e6c495e190e729fb60345336169c17aed9cd8955cc85bc6d802beaa1cd6f779e5586b336bba5c888e29e5a0b0202e6a011de77d89c30c3')

build() {
  make PREFIX=/usr -C $pkgname-$pkgver
}

package() {
  make PREFIX=/usr DESTDIR="${pkgdir}/" install -C $pkgname-$pkgver
}
