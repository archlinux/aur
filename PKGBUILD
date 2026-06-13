# Maintainer: Maurizio Morri <maurizio.morri@protonmail.com>

pkgname=samsung-galaxybook-5g
pkgver=0.1.0
pkgrel=1
pkgdesc='Samsung Galaxy Book 5G/LTE modem helpers and Omarchy Waybar UI'
arch=('any')
url='https://github.com/mmorri/samsung-galaxybook-5g'
license=('MIT')
depends=('fuzzel' 'iproute2' 'jq' 'libnotify' 'modemmanager' 'polkit' 'systemd')
install="$pkgname.install"
source=(
  'samsung-galaxybook-5g'
  'samsung-galaxybook-5g-status'
  'samsung-galaxybook-5gctl'
  'samsung-galaxybook-5g-setup-omarchy'
)
sha256sums=('643baca3951f793b87da253392a4b253605fa9293669cae8856525ad7899d588'
            'f80f53459e73ce1aef7f52baa5c4b7ef9bab4461f4edf70700a5e7f2595c4456'
            '5b8d1447801d2349d641ff97ae814c23454e5caa7ed50223ed88896d53160a06'
            '795006edc9dfb9678b11b2631e6d7a8122fc187f7ff8d9134de76a32f757b193')

package() {
  install -Dm755 samsung-galaxybook-5g "$pkgdir/usr/bin/samsung-galaxybook-5g"
  install -Dm755 samsung-galaxybook-5g-status "$pkgdir/usr/bin/samsung-galaxybook-5g-status"
  install -Dm755 samsung-galaxybook-5gctl "$pkgdir/usr/bin/samsung-galaxybook-5gctl"
  install -Dm755 samsung-galaxybook-5g-setup-omarchy "$pkgdir/usr/bin/samsung-galaxybook-5g-setup-omarchy"

  install -d "$pkgdir/etc/ModemManager/fcc-unlock.d"
  ln -s /usr/share/ModemManager/fcc-unlock.available.d/14c3:4d75 "$pkgdir/etc/ModemManager/fcc-unlock.d/14c3:4d75"
  ln -s /usr/share/ModemManager/fcc-unlock.available.d/105b "$pkgdir/etc/ModemManager/fcc-unlock.d/105b"
}
