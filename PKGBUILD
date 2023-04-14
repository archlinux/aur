# Maintainer: AlieZ <aaliezz840@gmail.com>
# Retrieved from
# https://gitlab.manjaro.org/packages/community/microsoft-office-online-jak.git

pkgname=('ms-office-online')
pkgver=2.1.2
pkgrel=1
epoch=1
_commit=ce29c6bfc3cb200e185b55a24a2e4f37f04fbd03
pkgdesc="Microsoft Office Suite Online as a native application"
url="https://www.office.com/"
depends=('python-jade-application-kit>=3.0.0')
license=('GPL3' 'CC')
arch=('any')
replaces=('microsoft-office-online-jak')
conflicts=('microsoft-office-online-jak')
source=("https://gitlab.manjaro.org/applications/ms-office-online-launcher/-/archive/$_commit/ms-office-online-launcher-$_commit.tar.gz")
sha256sums=('625be65dc252e76d12e5812f9ec3b44cfeff74e7b5c2b39bf12de949a68a59c7')

prepare() {
    mv "ms-office-online-launcher-$_commit" "ms-office-online-launcher-$pkgver" 
}

package() {
    cd "ms-office-online-launcher-$pkgver"
    install -Dm644 launcher.desktop "$pkgdir/usr/share/applications/ms-office-online.desktop"
    install -Dm644 icons/office.png "$pkgdir/usr/share/pixmaps/ms-office.png"
    install -Dm755 ms-office-online -t "$pkgdir/usr/bin/"
}
