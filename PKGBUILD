# Maintainer: Uffe Jakobsen <uffe at uffe dot org>

pkgname=git-notifier
pkgver=0.8
pkgrel=1
pkgdesc="Email change notifications for git (and GitHub)"
arch=(any)
url="http://www.icir.org/robin/git-notifier/"
license=('LicenseRef-BSD')
depends=('python' 'git')
source=("https://github.com/rsmmr/git-notifier/archive/v$pkgver.tar.gz")
sha256sums=('f040fe132297a21c17bcc16fda2b47232fc795b1a4e26c5d718572f55f83a1a2')

build()
{
  cd ${pkgname}-${pkgver}
  make doc
}

package()
{
  cd ${pkgname}-${pkgver}

  install -D -m644 git-notifier github-notifier -t "$pkgdir/usr/bin/"
  install -D -m644 git-notifier.1 github-notifier.1 -t "$pkgdir/usr/share/man/man1/"
  install -D -m644 git-notifier.conf "$pkgdir/usr/share/doc/$pkgname/git-notifier.conf.sample"
  install -D -m644 README.html CHANGES COPYING -t "$pkgdir/usr/share/doc/$pkgname/"
  install -D -m644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
