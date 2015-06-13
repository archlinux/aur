# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Ben Duffield <jebavarde@gmail.com>

pkgname=voximp
pkgver=0.0.1
pkgrel=4
arch=("any")
pkgdesc="Control your desktop with your voice"
url="http://voximp.googlecode.com"
license=("GPL")
depends=("gstreamer0.10-python" "gstreamer0.10-base-plugins" "python2" "pygtk" "pocketsphinx" "xdotool")
install=voximp.install
source=("http://voximp.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=("4e2b0d3a88257999866ad0028dd69c04")

prepare() {
  sed -i -e "s/python/python2/" "$srcdir/voximp.py"
}

package() {
  install -D -m755 "$srcdir/voximp.py" "$pkgdir/usr/bin/voximp"
  install -d -D -m755 "$srcdir/sample_configs" "$pkgdir/usr/share/voximp/sample_configs"
  install -D -m644 "$srcdir"/sample_configs/* "$pkgdir/usr/share/voximp/sample_configs/"
}

# vim:set ts=2 sw=2 et:
