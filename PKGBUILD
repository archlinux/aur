# Contributor: peshev <>
# Contributor: FFY00 <filipe.lains@gmail.com>
# Contributor: Cyberpunk <aur_linuxero@outlook.com>

pkgname=sparta
pkgver=2.0.0
_commit=d95993d283d69eb76d30565cea6ad49976685b5f
pkgrel=2
pkgdesc='Python GUI application which simplifies network infrastructure penetration testing.'
arch=('any')
url="https://github.com/SECFORCE/sparta"
license=('GPL2')
depends=('python-pyqt5' 'python-lxml')
makedepends=('git')
optdepends=('cutycapt: take screenshots of websites'
            'nmap: Nmap support'
            'hydra: bruteforce'
            'nikto: information gathering')
source=(#"$pkgname-$pkgver.tar.gz::https://github.com/SECFORCE/sparta/archive/v${pkgver}.tar.gz"
        git+https://github.com/SECFORCE/sparta.git#commit=$_commit
        'sparta_launcher')
sha512sums=('SKIP'
            '4bfe0ead2ef1a718f7312d13c77d1aed62347f93fff83c0a4a1620821078f60fc9eb637db19d6086d6c1043f6b6a4953903f7cb503aed5ee0bd72d3245a5adb1')

package() {
  install -dm 755 "$pkgdir"/usr/bin/
  install -dm 755 "$pkgdir"/usr/share/$pkgname

  find $pkgname -type f -not -path '*/.git*' -exec install -D -m 644 "{}" "$pkgdir"/usr/share/{} \;

  install -Dm 755 sparta_launcher "$pkgdir"/usr/bin/sparta
}
