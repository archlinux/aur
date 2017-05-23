# Maintainer: Sean Enck <enckse@gmail.com>
# Maintainer: Sherlock Holo <sherlockya(at)gmail.com>
pkgname=python-telegram-bot
pkgver=6.0.1
pkgrel=7
pkgdesc="A Python wrapper around the Telegram Bot API"
url="https://github.com/python-telegram-bot/python-telegram-bot"
depends=('python' 'python-future' 'python-setuptools' 'python-certifi')
license=('LGPLv3')
arch=('any')
source=("https://files.pythonhosted.org/packages/b3/86/0ce63db69006343f3b5f1cc90cf6fee2fc0d1ddf21949bd591daefedeff7/python-telegram-bot-6.0.1.tar.gz")
md5sums=('e6eb6d7e71a658415ebd8885f99d0945')

prepare(){
    cd $srcdir
    bsdtar -xf $pkgname-$pkgver.tar.gz
}

build(){
    cd $srcdir/$pkgname-$pkgver
    python setup.py build
}

package(){
    cd $srcdir/$pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
