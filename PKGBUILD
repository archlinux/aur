# Maintainer: teraflops <cprieto.ortiz@gmail.com>
pkgname=magmatv-git
_gitname=magmatv
pkgver=0.1.6.r5.gd73dae3
pkgrel=1
pkgdesc="Command line tool for manage and play series and films from any compliant torrent rss feed"
arch=('any')
url="https://git.frangor.info/magmatv"
license=('GPL3')
depends=('peerflix-git' 'mpv' 'sqlite' 'libxml2' 'sed' 'curl')
makedepends=('git')
optdepends=('subliminal-git: subtitles support' 'notify-send')
provides=('magmatv-git')
conflicts=('magmatv')
source=('magmatv::git+https://git.frangor.info/magmatv#branch=dev')
sha256sums=('SKIP')

pkgver() {
 cd "$srcdir/$_gitname"
 git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
 cd "${srcdir}/${_gitname}"
 install -Dm755 magmatv "${pkgdir}/usr/bin/${_gitname}"
 install -Dm644 magmatv.bash_completion "${pkgdir}/etc/bash_completion.d/${_gitname}" 
}

# vim:set ts=2 sw=2 et:
