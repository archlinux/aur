# Contributor: speps <speps at aut dot archlinux dot org>
# Contributor: Reihar <reihar at necronomicon dot fr> 

pkgname=plowshare-git
pkgver=2.1.6.r14.gbe562b44
pkgrel=1
pkgdesc="Command-line downloader and uploader for Rapidshare, Mediafire and other file sharing websites."
arch=('any')
url="https://github.com/mcrapet/plowshare"
license=('GPL3')
depends=('curl' 'recode' 'js185')
makedepends=('git')
optdepends=('bash-completion: enable bash auto completion'
            'libcaca: ascii display for no X server'
            'tiv: ascii display for no X server'
            'aview: ascii display for no X server')
provides=('plowshare')
conflicts=('plowshare')
replaces=('plowshare-svn')
source=("$pkgname::git+https://github.com/mcrapet/plowshare.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/.//;s/-/.r/;s/-/./'
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir/" PREFIX=/usr make
}

# vim:set ts=2 sw=2 et:
