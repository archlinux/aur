# Maintainer: Sébastien Leduc <sebastien@sleduc.fr>
# Contributor: Dak <dak.linux at gmail dot com>

pkgname=freealchemist
pkgver=0.5
pkgrel=4
pkgdesc="A figure block game written in Python where you have to connect blocks"
arch=('any')
url="http://dakblog.wordpress.com/freealchemist/"
license=('GPL')
depends=('python2' 'python2-pygame')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.bz2"
        "freealchemist-starter")
md5sums=('550126b213119967183e0cf6532b1157'
         '7b7027eecfb4457fc1fde4d7b7b68b3a')

package() {
  cd "$srcdir"
  install -D -m 755 freealchemist-starter "$pkgdir/usr/bin/freealchemist"
  cd "$pkgname-$pkgver"
  install -D -m 755 freealchemist.py "$pkgdir/usr/share/games/freealchemist/freealchemist.py"
  install -d -m 755 media "$pkgdir/usr/share/games/freealchemist/media"
  install -m 644 media/* "$pkgdir/usr/share/games/freealchemist/media"
}
# vim:set ts=2 sw=2 et:
