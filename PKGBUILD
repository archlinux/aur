# Maintainer: FFY00 <filipe.lains@gmail.com>
# Contributor: Cyberpunk <aur_linuxero@outlook.com>
pkgname=sparta
pkgver=1.0.1
pkgrel=1
pkgdesc="Python GUI application which simplifies network infrastructure penetration testing."
arch=('any')
url="https://sparta.secforce.com/"
license=('GPL2')
depends=('python2' 'python2-pyqt4<=4.10.0' 'python2-elixir' 'python2-lxml')
optdepends=('cutycapt: take screenshots of websites'
	    'nmap: Nmap support'
	    'hydra: bruteforce'
	    'nikto: information gathering')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SECFORCE/sparta/archive/v${pkgver}.tar.gz"
	'sparta_launcher')
sha256sums=('14aba154a94f2f31929087849c0dde44cdb59c337a8ecf2b0cecbae71690738f'
	    'b4ff80756b302f76f5d20c9f92de42382d396ae29abf83e1158e18cbe493e31b')

package() {
  install -dm 755 "$pkgdir"/usr/bin/
  install -dm 755 "$pkgdir"/usr/share/$pkgname

  find "$srcdir"/$pkgname-$pkgver -type f -exec install -m 644 "{}" "$pkgdir"/usr/share/$pkgname \;

  install -Dm 755 "$srcdir"/sparta_launcher "$pkgdir"/usr/bin/sparta
}
