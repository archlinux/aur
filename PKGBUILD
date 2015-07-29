# Maintainer: Jonathan Steel <jsteel at aur.archlinux.org>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Contributor: Marvin Lampe <marvin.lampe@gmx.de>

pkgname=get-flash-videos-git
_gitname=get-flash-videos
pkgver=v1.22.556.g2d46d08
pkgrel=1
pkgdesc='Downloads videos from various Flash-based video hosting sites'
arch=('any')
url='http://code.google.com/p/get-flash-videos'
license=('APACHE')
depends=('perl-www-mechanize' 'perl-http-cookies' 'perl-lwp-protocol-https'
  'perl-module-find' 'perl-lwp-protocol-socks' 'perl-tie-ixhash'
  'perl-data-amf' 'perl-xml-simple')
makedepends=('git' 'perl')
optdepends=('mplayer: for video streaming')
conflicts=('get_flash_videos' 'get-flash-videos')
provides=('get_flash_videos' 'get-flash-videos')
source=(git://github.com/monsieurvideo/get-flash-videos.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_gitname

  git describe | sed s/-/./g
}

build() {
  cd "$srcdir"/$_gitname

  make
}

package() {
  cd "$srcdir"/$_gitname

  make install DESTDIR="$pkgdir"/ INSTALL_BASE=/usr \
    INSTALLSITELIB=/usr/lib/perl5/site_perl INSTALLSITESCRIPT=/usr/bin
}
