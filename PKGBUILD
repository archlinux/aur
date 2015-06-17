# Maintainer: M0Rf30

pkgname=your-freedom
pkgver=20150219
_subver=01
pkgrel=1
pkgdesc="A service to bypass Firewalls, Proxies and content Filters and stay anonymous while surfing, playing and downloading"
arch=('any')
url="https://www.your-freedom.net/"
license=('LGPL2.1' 'custom:ACCEPTABLE USE POLICY')
depends=('java-runtime' 'bash')
optdepends=('openvpn: VPN mode support'
	    'dante: socksification support'
	    'tsocks: socksification support')
source=("https://www.your-freedom.net/ems-dist/freedom-$pkgver-$_subver.zip"
	'your-freedom.sh'
	'your-freedom.desktop'
	'ACCEPTABLE_USE_POLICY')

package() {
  cd "$srcdir"
  install -D -m755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -D "iconopened.ico" "$pkgdir/usr/share/$pkgname/yf.ico"
  install -D "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D "freedom.jar" "$pkgdir/usr/share/java/$pkgname/freedom.jar"
  install -D "ACCEPTABLE_USE_POLICY" "$pkgdir/usr/share/licenses/$pkgname/ACCEPTABLE USE POLICY"
}

md5sums=('74de450cb6d52536f52058e1a21eba81'
         'a36bb8fcfcc17a143274c734a2fd4f9e'
         '1b42f99852bea048e55ef0fc8f29e511'
         'e71ac5216e24c68db28abc1d92fba5d5')
