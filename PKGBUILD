# Maintainer: lucaszhou007 <lucaszhou007@163.com>
pkgname=les11-mc-dx-overtemp-shutdown
pkgver=1.0.0
pkgrel=1
pkgdesc="Shut the system down when any LES11-MC-Dx USB temperature probe exceeds a configured maximum"
arch=('any')
license=('0BSD')
url="http://www.lesminer.com/productinfo/180794.html"
depends=('python' 'python-pyserial')
install="${pkgname}.install"
source=("les11-mc-dx-overtemp-shutdown.py"
        "les11-mc-dx-overtemp-shutdown.service"
        "les11-mc-dx-overtemp-shutdown.polkit"
        "les11-mc-dx-overtemp-shutdown.sysusers"
        "config.toml"
        "LICENSE")
b2sums=('cfa4ca0729b0bb31d46ad3557b13085576c1e86c31136603f086a3c26ca5589cdde5d59d313097049fbccbbaba4c5265db655760454e9819b2e71a3354d43ad6'
        'db30430b6850ec6c6f6e6d162221fbe4ab19ec5e0b993bb3c672a30b49cd49c6ca7315890d0c4807e69824e2a41786af514d1b1e4d3a072cb601501e25615f6d'
        'f23c6002ed2187d66dff9f29cd64a11f382c5badeea99d4a96c530626a2a5fd8cbe865458d77a73b5e773f3c9b86ddd7d43436b427ed13ec6cb17554c4aa260c'
        'ce029d65733b8ceee5722d393256c2ff7756bb96850647165541d72c253ed495985050c702995c19e637cc6ab5c38123591885d5fbb2cc71ae7f0c68d58f1d08'
        '823fcec1e6fb579a6e2276ac2e73f7b9ba704de4011d63ebe3f09863684ba319469ce3ca572101464f6c9fe0a030ebbf67aa96e47fdd7eeecce5fa8259b8d810'
        'a58bbb51ab7667a799cdc0b3e2229f06484483761351456acb8d08b7ef85c18286016287ad9e7da3f44658472e6f2567173a992ba3f310c1e90a138ab858a9f7')

package() {
  install -Dm755 "$srcdir/les11-mc-dx-overtemp-shutdown.py" "$pkgdir/usr/bin/les11-mc-dx-overtemp-shutdown"
  install -Dm644 "$srcdir/les11-mc-dx-overtemp-shutdown.service" "$pkgdir/usr/lib/systemd/system/les11-mc-dx-overtemp-shutdown.service"
  install -Dm644 "$srcdir/les11-mc-dx-overtemp-shutdown.polkit" "$pkgdir/etc/polkit-1/rules.d/50-les11-mc-dx-overtemp-shutdown.rules"
  install -Dm644 "$srcdir/les11-mc-dx-overtemp-shutdown.sysusers" "$pkgdir/usr/lib/sysusers.d/les11-mc-dx-overtemp-shutdown.conf"
  install -Dm644 "$srcdir/config.toml" "$pkgdir/etc/les11-mc-dx-overtemp-shutdown/config.toml"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/les11-mc-dx-overtemp-shutdown/LICENSE"
}

backup=("etc/les11-mc-dx-overtemp-shutdown/config.toml")
