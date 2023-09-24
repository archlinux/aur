# Maintainer: killab33z <killab33z @ protonmail-dot-com>
pkgname=pyclean-git
_pkgname=pyclean
pkgver=2023.09.16.25ccced
pkgrel=1
pkgdesc="A Usenet spamfilter written in Python"
url="https://github.com/crooks/pyclean"
arch=('x86_64')
license=('GPL3')
depends=('python')
makedepends=('git')
backup=(usr/local/news/pyclean/etc/ih_substrings
        usr/local/news/pyclean/etc/local_hosts
        usr/local/news/pyclean/etc/log_rules
        usr/local/news/pyclean/etc/pyclean.cfg)
source=("git+$url")
sha256sums=('SKIP')

package() {
  cd "$srcdir"/$_pkgname
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "$srcdir/$_pkgname/README" "$pkgdir/opt/$_pkgname/README"
  install -Dm755 "$srcdir/$_pkgname/INN.py" "$pkgdir/opt/$_pkgname/INN.py"
  install -Dm755 "$srcdir/$_pkgname/pyclean.py" "$pkgdir/opt/$_pkgname/pyclean.py"

  install -Dm644 "$srcdir/$_pkgname/samples/ih_substrings" "$pkgdir/usr/local/news/$_pkgname/etc/ih_substrings"
  install -Dm644 "$srcdir/$_pkgname/samples/local_hosts" "$pkgdir/usr/local/news/$_pkgname/etc/local_hosts"
  install -Dm644 "$srcdir/$_pkgname/samples/log_rules" "$pkgdir/usr/local/news/$_pkgname/etc/log_rules"
  install -Dm644 "$srcdir/$_pkgname/samples/pyclean.cfg.sample" "$pkgdir/usr/local/news/$_pkgname/etc/pyclean.cfg"

  # create symlinks
  install -d "$pkgdir/usr/bin"
  ln -s /opt/$_pkgname/pyclean.py "$pkgdir/usr/bin"
}
