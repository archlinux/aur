# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
pkgname=ntfy
pkgver=2.7.1
pkgrel=1
pkgdesc="A utility for sending push notifications to various notification systems (Pushover, Pushbullet, XMPP, etc.)"
url="https://github.com/dschep/$pkgname"
depends=('python' 'python-requests' 'python-yaml' 'python-appdirs' 'xorg-xprop' 'python-ruamel-yaml')
makedepends=('python3' 'python-setuptools')
optdepends=('python-dbus: Desktop notifications'
    'python-emoji: Emoji support')
license=('GPL-3.0')
arch=(any)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('1586281b8781f84c7487e2ec1c7284e6')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i 's/getargspec/getfullargspec/' "$pkgname/__init__.py"
}

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
