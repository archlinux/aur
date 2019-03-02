# Maintainer: FFY00 <filipe.lains@gmail.com>
# Contributor: Cyberpunk <aur_linuxero@outlook.com>

pkgname=sparta
pkgver=1.0.4
pkgrel=1
pkgdesc='Python GUI application which simplifies network infrastructure penetration testing.'
arch=('any')
url='https://sparta.secforce.com'
license=('GPL2')
depends=('python2' 'python2-pyqt4<=4.10.0' 'python2-elixir' 'python2-lxml')
optdepends=('cutycapt: take screenshots of websites'
            'nmap: Nmap support'
            'hydra: bruteforce'
            'nikto: information gathering')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SECFORCE/sparta/archive/v${pkgver}.tar.gz"
        'sparta_launcher')
sha512sums=('d86d41ee0a3695e0252f4c0a03952fb4ace33501bdb03e0e46a88a12029298bf9aa9579ed51c948d20a63fc4656d9afb73b82d5d97f100da7c626fcb73dd1971'
            '3cfe8da520b66b06cb86e8847d1e89176348d2c1ac32a83d6953ecc3c3481b3c593aa2eeabee4ad78ad5025d87fb18892dacaf100a73cdb20ae7b197796bc9ee')

package() {
  install -dm 755 "$pkgdir"/usr/bin/
  install -dm 755 "$pkgdir"/usr/share/$pkgname

  find $pkgname-$pkgver -type f -exec install -m 644 "{}" "$pkgdir"/usr/share/$pkgname \;

  install -Dm 755 sparta_launcher "$pkgdir"/usr/bin/sparta
}
