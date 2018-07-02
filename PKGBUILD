# Maintainer: FFY00 <filipe.lains@gmail.com>
# Contributor: Cyberpunk <aur_linuxero@outlook.com>

pkgname=sparta
pkgver=1.0.1
pkgrel=1
pkgdesc="Is a python GUI application which simplifies network infrastructure penetration testing by aiding the penetration tester in the scanning and enumeration phase."
arch=('any')
url="http://sparta.secforce.com/"
license=('GPL2')
depends=('python2' 'python2-pyqt4<=4.10.0' 'python2-elixir' 'python2-lxml')
optdepends=('cutycapt: take screenshots of websites')
makedeps=('nmap' 'hydra' 'nikto')
provides=('sparta')
conflicts=('sparta')
source=(
  "https://github.com/SECFORCE/sparta/archive/v${pkgver}.tar.gz"
  'sparta_launcher'
)
md5sums=(
  '710f86f0037e735e44a3dcd01db96af6'
  '58f2181719cf57f9d5df3da9c8145c57'
)

package() {
  install -dm 755 "$pkgdir"/usr/bin/
  install -dm 755 "$pkgdir"/usr/share/$pkgname

  find "$srcdir"/$pkgname-$pkgver -type f -exec install -m 644 "{}" "$pkgdir"/usr/share/$pkgname \;

  install -Dm 755 "$srcdir"/sparta_launcher "$pkgdir"/usr/bin/sparta
}
