# Maintainer: anekos <anekos@snca.net>
pkgname=lfe-git
pkgver=20160518
pkgrel=1
pkgdesc="Lisp Flavoured Erlang"
url="http://lfe.io/"
arch=('i686' 'x86_64')
license=('Apache_v2')
depends=('erlang')
source=("$pkgname::git+https://github.com/rvirding/lfe/")
md5sums=('SKIP')

package () {
  cd $srcdir/$pkgname

  make compile

  mkdir -p "$pkgdir/opt/lfe"
  cp -r * "$pkgdir/opt/lfe/"

  cd "$pkgdir/opt/lfe/"

  make install-man MANINSTDIR="$pkgdir/usr/share/man"

  install -d -m755 "$pkgdir/usr/bin"

	ln -sf /opt/lfe/bin/lfe "$pkgdir/usr/bin/"
	ln -sf /opt/lfe/bin/lfec "$pkgdir/usr/bin/"
	ln -sf /opt/lfe/bin/lfedoc "$pkgdir/usr/bin/"
	ln -sf /opt/lfe/bin/lfescript "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:

