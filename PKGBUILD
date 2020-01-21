# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=jmc
pkgver=0.3rc3
pkgrel=1
_commit=8db8619603afa408d47078112106a64e0c3e9f9b
pkgdesc="jabber mail component"
arch=(any)
url="https://github.com/dax/jmc"
license=("GPL")
backup=(etc/jabber/jmc.conf)
depends=('python2' 'python2-pyxmpp' 'jcl')
makedepends=('git' 'python2-setuptools')
install=jmc.install
source=("git+https://github.com/dax/jmc.git#commit=${_commit}"
	jmc.service)
sha256sums=('SKIP'
            '93770f067647182d917df0206f8a6a47ab26bad009a5388bc1e3a240318c59f1')

package() {
  cd "$srcdir/jmc"
  python2 setup.py install --root="$pkgdir"
  install -dm0755 "$pkgdir"/var/spool/jabber
  install -Dm0644 "$srcdir"/jmc.service "$pkgdir"/usr/lib/systemd/system/jmc.service
}
