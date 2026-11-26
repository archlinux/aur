# Maintainer: none
pkgname=b580-watt-freq
pkgver=1.1
pkgrel=6
pkgdesc="Sets Intel Arc B580 power limit and frequency without LACT, with frequency step detection and no daemon"
arch=('any')
url="https://aur.archlinux.org/packages/b580-watt-freq"
license=('MIT')
depends=('bash' 'systemd')
backup=('etc/b580.conf')
install='b580-watt-freq.install'
source=('b580_watt_freq'
        'b580-detect-freq'
        'b580.conf'
        'b580-watt-freq.service'
        'b580-watt-freq-resume.service'
        'b580-watt-freq.install')
sha256sums=('c78e97aa038a09bc07a13db0f0e099bed9f580785c7229b09e6a47a51b542675'
            '80d451e85f0c2156b93b8a4c93456c48b742fcaf76a6870b64b3c045ae83a72e'
            '8c0596234eb609a43fdcf8d18e3953557f86e87eb09acd03667e3f26f96ffdef'
            '6a387a82ea0fd5d83b19c18b1510428ce0ff7790eae45412f05c74734cdf0507'
            '3cc3a67c582ccd218c7749e26d102aab7314ad38e374cf1dcd1d7eac53e82358'
            '9bd8aa70d0dee8705ad5fa979da168984e566859592101fe2083f6407ac40f5f')

package() {
  install -Dm755 "$srcdir/b580_watt_freq" "$pkgdir/usr/bin/b580_watt_freq"
  install -Dm755 "$srcdir/b580-detect-freq" "$pkgdir/usr/bin/b580-detect-freq"
  install -Dm644 "$srcdir/b580.conf" "$pkgdir/etc/b580.conf"
  install -Dm644 "$srcdir/b580-watt-freq.service" "$pkgdir/usr/lib/systemd/system/b580-watt-freq.service"
  install -Dm644 "$srcdir/b580-watt-freq-resume.service" "$pkgdir/usr/lib/systemd/system/b580-watt-freq-resume.service"
}
