# Maintainer : Sravan Pannala <sradjoker@endeavouros.com>
# Contributor : Jonathon Fernyhough <jonathon+m2x dev>
# Contributor : twa022 <twa022 at gmail dot com>
# Contributor : Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor : Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-tweak
pkgver=22.10.0
_umsver=22.10.2
pkgrel=3
pkgdesc="Tweak tool for MATE (fork of MintDesktop)"
arch=('any')
url="https://github.com/ubuntu-mate/mate-tweak"
license=('GPL')
depends=('gtk3' 'libnotify' 'mate-applets' 'python-configobj' 'python-distro' 'python-gobject' 'python-psutil' 'python-setproctitle')
makedepends=('python-distutils-extra' 'python-setuptools')
optdepends=('brisk-menu: for Manjaro panel layout'
            'mate-applet-dock: for Mutiny panel layout'
            'mate-menu: to enable advanced menu'
            'mate-netbook: for Netbook panel layout'
            'plank: for Cupertino panel layout'
            'synapse: to enable launcher'
            'tilda: to enable pull-down terminal'
            'topmenu-gtk: for Mutiny panel layout'
            'vala-panel-appmenu-mate: for Mutiny,Cupertino')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ubuntu-mate/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c33c092b0151b50d8a5706825f1bcef57f1738f8f5cf22af49c11f45bc14e84a')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's|/usr/lib/mate-applets/topmenu-mate-panel-applet|/usr/lib/topmenu-gtk/topmenu-mate-panel-applet|' mate-tweak
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
