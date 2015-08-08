# Maintainer: Jeremy Ruten <jeremy.ruten@gmail.com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Dmitry N.Shilov <stormblast@land.ru>
pkgname=xcursor-human
pkgver=0.6
pkgrel=4
pkgdesc="Ubuntu's default cursor theme"
arch=('any')
url="http://launchpad.net/human-cursors-theme/"
license=('CCPL:by-sa')
makedepends=('python')
#source=(http://mirror.nttu.edu.tw/ubuntu/pool/universe/h/human-cursors-theme/human-cursors-theme_$pkgver.tar.gz)
source=(https://launchpad.net/ubuntu/+archive/primary/+files/human-cursors-theme_$pkgver.tar.gz
        index.theme)
sha256sums=('28278807df05a8b305907257ed34f172e3aa849ef978cfade077131ffdde8424'
            '59aebd9e2502cb5f6e445b57b2d7bba5f2382989ca064805b9570b57870a3c6b')

package() {
  cd "$srcdir/human-cursors-theme-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 ../index.theme "$pkgdir/usr/share/icons/Human/index.theme"
  rm -rf "$pkgdir/usr/lib"
}

# vim:set ts=2 sw=2 et:
