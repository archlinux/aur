# Maintainer: Thiago Coutinho <root@thiagoc.net>
# https://github.com/thiagoc/aur-packages

pkgname=rss2email-wking
pkgver=3.9
pkgrel=1
pkgdesc="A tool for delivering news from RSS feeds to your email program"
arch=("any")
url="https://github.com/wking/rss2email"
license=("GPL")
depends=("python" "python-html2text" "python-feedparser")
conflicts=('rss2email' 'rss2email-git' 'rss2email-xdg-git')
source=("https://github.com/wking/rss2email/archive/v$pkgver.zip")
md5sums=('33884132e027c224bd1ce3097c1f60ee')
options=(zipman)

package() {
  cd "$srcdir/rss2email-$pkgver"
  python setup.py install \
      --prefix=/usr \
      --root="$pkgdir"
  install -D -m644 ./README "$pkgdir"/usr/share/rss2email/README
  install -m644 ./CHANGELOG "$pkgdir"/usr/share/rss2email
  install -D -m644 ./r2e.1 "$pkgdir"/usr/share/man/man1/r2e.1
}

# vim:set ts=2 sw=2 et:
