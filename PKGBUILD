# Maintainer: Dictator Mei <dctxmei@gmail.com>
pkgname=qqbot
pkgver=2.3.10
pkgrel=1
pkgdesc="A conversation robot base on Tencent's SmartQQ"
arch=('any')
url="https://github.com/pandolia/qqbot"
license=('MIT')
depends=("python" "python-apscheduler" "python-certifi" "python-requests")
source=("https://github.com/pandolia/qqbot/archive/v$pkgver.tar.gz")
sha512sums=('c72f8a1c153c97a50adfaeb7704cbdacebcdd01b4a603e1a34ab571447cf3a2747c4da6480f7ce070eccd2b7fe5e3306924a111be1f680947fab245ee266a813')

build() {
    cd "$srcdir"/qqbot-$pkgver
    python setup.py build
}

package() {
    cd qqbot-$pkgver
    python setup.py install --root="$pkgdir"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
