# Maintainer: LevitatingBusinessMan <me@levitati.ng>
pkgname=rrd2html
pkgver=0.0.1
pkgrel=6
pkgdesc='A tool for generating html pages from rrd data'
arch=(any)
url='https://github.com/LevitatingBusinessMan/rrd2html.rb'
license=('MIT')
depends=('ruby' 'rrdtool' 'ruby-tomlrb')
backup=('etc/rrd2html.toml')
_commit='fb514c7ed2b815d809ab88a92f7be6e6bb4df77e'
source=("$pkgname-$pkgrel::git+https://github.com/LevitatingBusinessMan/rrd2html.rb.git#commit=$_commit")
sha256sums=('SKIP')

package() {
	cd "$pkgname-$pkgrel"
	install -Dm755 rrd2html.rb "$pkgdir/usr/bin/rrd2html.rb"
	install -Dm755 README.adoc "$pkgdir/usr/share/rrd2html/README.adoc"
	install -Dm644 rrd2html.slim "$pkgdir/usr/share/rrd2html/rrd2html.slim"
	install -Dm644 rrd2html.toml "$pkgdir/etc/rrd2html.toml"
}
