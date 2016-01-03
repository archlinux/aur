pkgname=tt-rss-refspoof-git
_gitname=af_refspoof
pkgver=r7
pkgrel=1
pkgdesc="TT-RSS plugin to fake referral on feed images"
arch=('any')
url="https://github.com/Alekc/af_refspoof"
license=('GPL2')
depends=('tt-rss')
makedepends=('git')
source=('git+https://github.com/Alekc/af_refspoof.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo r$(git rev-list --count HEAD)
}

package() {
  cd "$_gitname"
  _instdir="$pkgdir/usr/share/webapps/tt-rss/plugins/af_refspoof/"
  install -d -m755 $_instdir
  install -D -m644 init.php $_instdir
  install -D -m644 PhCURL.php $_instdir
  install -D -m644 LICENSE $_instdir
}
