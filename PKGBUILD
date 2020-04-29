# Maintainer: Thomas Hobson <thomas@hexf.me>
pkgname=python3-beautifuldiscord
pkgver=0.1.1
pkgrel=1
epoch=0
pkgdesc="Custom CSS Injector for Discord"
arch=('x86_64')
url="https://github.com/leovoel/BeautifulDiscord"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-psutil' 'python')
provides=('beautifuldiscord' 'python-beautifuldiscord')
source=("https://github.com/leovoel/BeautifulDiscord/archive/17c20c4bd885758cbfef49daf0f27ce1be2ff1ff.zip")
sha256sums=('f0b07c81525ca5f3b79b8733899b7faab9244a0eb677e5bc10aa50a592f7afec')

build() {
    cd BeautifulDiscord-*/
    python setup.py build
}

package() {
    cd BeautifulDiscord-*/
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}