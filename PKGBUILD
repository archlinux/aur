# Maintainer: Uffe Jakobsen <uffe at uffe dot org>

pkgname=git-notifier
pkgver=0.6
pkgrel=1
pkgdesc="Email change notifications for git (and GitHub)"
arch=(any)
url="http://www.icir.org/robin/git-notifier/"
license=('custom:BSD')
depends=('python' 'git')
source=("https://github.com/rsmmr/git-notifier/archive/v$pkgver.tar.gz")
md5sums=('edc8b7f6bd6b1c2f90eceb8ce0bdb72a')


build() {
  cd $pkgname-$pkgver
  make doc
}

package() {
  cd $pkgname-$pkgver
  install -D -m644 README.html CHANGES COPYING -t "$pkgdir/usr/share/doc/$pkgname/"
  install -D -m644 git-notifier github-notifier -t "$pkgdir/usr/bin/"
  #install -D -m644 git-notifier.1 github-notifier.1 -t "$pkgdir/usr/share/man/man1/"
}

# vim:set ts=2 sw=2 et:
