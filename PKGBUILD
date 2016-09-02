# Maintainer:	M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=thonny
pkgver=2.0.0b4
pkgrel=1
pkgdesc="Python IDE for beginners."
arch=('any')
url="http://thonny.cs.ut.ee/"
license=('MIT')
depends=('openssl' 'python' 'python-beautifulsoup4' 'python-jedi' 'tcl' 'tk')
source=("https://bitbucket.org/plas/$pkgname/downloads/$pkgname-$pkgver-x86_64.tar.gz")
sha256sums=('95c86ba5c783dfbbd29351fa2e057192bc0fa22c2dd4d6354f9b917836f347c5')

package() {
	cd "$srcdir"
	
	install -Dm 755 "$pkgname/bin/thonny" "$pkgdir/usr/bin/thonny"
	
	sed -i 's|$target_dir|/usr|' "$pkgname/templates/Thonny.desktop"
	install -Dm 644 "$pkgname/templates/Thonny.desktop" "$pkgdir/usr/share/applications/thonny.desktop"
	
	install -Dm 644 "$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	
	install -d  644 "$pkgdir/usr/lib/python3.5/site-packages/thonny"
	cp -dr --no-preserve=ownership "$pkgname/lib/python3.5/site-packages/thonny" \
		"$pkgdir/usr/lib/python3.5/site-packages"
		
	install -d  644 "$pkgdir/usr/lib/python3.5/site-packages/thonny-$pkgver.dist-info"
	cp -dr --no-preserve=ownership "$pkgname/lib/python3.5/site-packages/thonny-$pkgver.dist-info" \
		"$pkgdir/usr/lib/python3.5/site-packages"
	
	install -Dm 644 "$pkgname/lib/python3.5/site-packages/distro.py" \
		"$pkgdir/usr/lib/python3.5/site-packages/distro.py"
		
	install -d  644 "$pkgdir/usr/lib/python3.5/site-packages/distro-0.6.0-py3.5.egg-info"
	cp -dr --no-preserve=ownership "$pkgname/lib/python3.5/site-packages/distro-0.6.0-py3.5.egg-info" \
		"$pkgdir/usr/lib/python3.5/site-packages"		
		
	install -d  644 "$pkgdir/usr/lib/python3.5/site-packages/tkinterhtml"
	cp -dr --no-preserve=ownership "$pkgname/lib/python3.5/site-packages/tkinterhtml" \
		"$pkgdir/usr/lib/python3.5/site-packages"
	
	install -d  644 "$pkgdir/usr/lib/python3.5/site-packages/tkinterhtml-0.7-py3.5.egg-info"
	cp -dr --no-preserve=ownership "$pkgname/lib/python3.5/site-packages/tkinterhtml-0.7-py3.5.egg-info" \
		"$pkgdir/usr/lib/python3.5/site-packages"
}
