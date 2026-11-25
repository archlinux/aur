# Maintainer: none
pkgname=b580-watt-freq
pkgver=1.1
pkgrel=3
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
        'b580-watt-freq-sleep'
        'b580-watt-freq.install')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
  install -Dm755 "$srcdir/b580_watt_freq" "$pkgdir/usr/bin/b580_watt_freq"
  install -Dm755 "$srcdir/b580-detect-freq" "$pkgdir/usr/bin/b580-detect-freq"
  install -Dm644 "$srcdir/b580.conf" "$pkgdir/etc/b580.conf"
  install -Dm644 "$srcdir/b580-watt-freq.service" "$pkgdir/usr/lib/systemd/system/b580-watt-freq.service"
  install -Dm644 "$srcdir/b580-watt-freq-resume.service" "$pkgdir/usr/lib/systemd/system/b580-watt-freq-resume.service"
  install -Dm755 "$srcdir/b580-watt-freq-sleep" "$pkgdir/usr/lib/systemd/system-sleep/b580-watt-freq"
}
