# Maintainer: Sean Enck <enckse@gmail.com>
# Maintainer: Sherlock Holo <sherlockya(at)gmail.com>
pkgname=python-telegram-bot
pkgver=6.0.1
pkgrel=2
pkgdesc="A Python wrapper around the Telegram Bot API"
url="https://github.com/python-telegram-bot/python-telegram-bot"
depends=('python' 'python-future' 'python-certifi' 'python-setuptools')
#makedepends=('python3' )
license=('LGPLv3')
arch=('any')
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz"
        "https://github.com/python-telegram-bot/urllib3/archive/4b076eedffc1afabf0215ced3820603de73d1ce7.zip")
md5sums=('b5b9b612b138839f739ef524f127b162'
         '3425796ecf8b71a17e5cca7a8a2c8e25')

prepare(){
    cd $srcdir
    bsdtar -xf v$pkgver.tar.gz
    bsdtar -xf 4b076eedffc1afabf0215ced3820603de73d1ce7.zip
    mv urllib3-4b076eedffc1afabf0215ced3820603de73d1ce7/*  $srcdir/$pkgname-$pkgver/telegram/vendor/urllib3/
}

package() {
    bsdtar -xf v$pkgver.tar.gz
    cd $srcdir/$pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
